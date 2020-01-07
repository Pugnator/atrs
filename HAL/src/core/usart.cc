/*******************************************************************************
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 * 2015, 2016
 *******************************************************************************/
#include <core/core.hpp>
#include <core/io_macro.hpp>
#include <core/isr_helper.hpp>
#include <core/usart.hpp>
#include <global.hpp>
#include <queue.hpp>
#include <log.hpp>

#ifdef USART_DEBUG
#define DEBUG_LOG PrintF
#else
#define DEBUG_LOG(...)
#endif

/* USART class */

#define UARTirq (USART1_IRQn - 1)
#define _SR Reg->SR
#define _DR Reg->DR

USART::USART(uint32_t ch, uint32_t bd, USART *isrptr)
{
  __disable_irq();
  channel = ch;
  next = 0;
  extirq = isrptr;
  memset(outbuf, 0, sizeof outbuf);
  memset(inbuf, 0, sizeof inbuf);
  QueueInit();
  signup();
  init(ch, bd);
  __enable_irq();
}

/* In the destructor we assign IRQ to default one in order to avoid CPU hang */
USART::~USART(void)
{
  __disable_irq();
  signout();
  __enable_irq();
  __ISB();
}

void USART::dma_on()
{
  __disable_irq();
  //HARDWARE_TABLE[DMA1_Channel4_IRQn + IRQ0_EX] = (uint32_t) &dmatx;
  //HARDWARE_TABLE[DMA1_Channel5_IRQn + IRQ0_EX] = (uint32_t) &dmarx;

  RCC->AHBENR |= RCC_AHBENR_DMA1EN;

  //Transmit
  DMA1_Channel4->CCR &= ~DMA_CCR4_EN;
  DMA1_Channel4->CPAR = (uint32_t)&Reg->DR;
  DMA1_Channel4->CMAR = (uint32_t)&outbuf[0];
  DMA1_Channel4->CNDTR = sizeof outbuf;

  DMA1_Channel4->CCR = 0;
  DMA1_Channel4->CCR &= ~DMA_CCR4_CIRC;
  DMA1_Channel4->CCR |= DMA_CCR4_DIR;

  DMA1_Channel4->CCR &= ~DMA_CCR4_TCIE;

  DMA1_Channel4->CCR &= ~DMA_CCR4_PSIZE;
  DMA1_Channel4->CCR &= ~DMA_CCR4_PINC;

  DMA1_Channel4->CCR &= ~DMA_CCR4_MSIZE;
  DMA1_Channel4->CCR |= DMA_CCR4_MINC;
  Reg->CR3 |= USART_CR3_DMAT;

  NVIC_EnableIRQ(DMA1_Channel4_IRQn);
  NVIC_SetPriority(DMA1_Channel4_IRQn, 4);

  //Receive
  DMA1_Channel5->CCR &= ~DMA_CCR5_EN;
  DMA1_Channel5->CPAR = (uint32_t)&Reg->DR;
  DMA1_Channel5->CMAR = (uint32_t)&inbuf[0];
  DMA1_Channel5->CNDTR = sizeof inbuf;

  DMA1_Channel5->CCR = 0;
  DMA1_Channel5->CCR &= ~DMA_CCR5_CIRC;
  //DMA1_Channel5->CCR  &=  ~DMA_CCR5_DIR;
  DMA1_Channel5->CCR &= ~DMA_CCR5_TCIE;
  DMA1_Channel5->CCR &= ~DMA_CCR5_PSIZE;
  DMA1_Channel5->CCR &= ~DMA_CCR5_PINC;

  DMA1_Channel5->CCR &= ~DMA_CCR5_MSIZE;
  DMA1_Channel5->CCR |= DMA_CCR5_MINC;
  Reg->CR3 |= USART_CR3_DMAR;

  NVIC_EnableIRQ(DMA1_Channel5_IRQn);
  NVIC_SetPriority(DMA1_Channel5_IRQn, 4);

  __enable_irq();
  __ISB();
}

void USART::dma_off()
{
  DMA1_Channel4->CCR = 0;
  DMA1_Channel5->CCR = 0;
  RCC->AHBENR &= ~RCC_AHBENR_DMA1EN;
}

bool USART::is_dma_on()
{
  return RCC->AHBENR & RCC_AHBENR_DMA1EN;
}

void USART::dmatx_go(uint32_t size)
{
  DMA1_Channel4->CCR &= ~DMA_CCR4_EN;
  DMA1_Channel4->CNDTR = size;
  DMA1->IFCR |= DMA_IFCR_CTCIF4;
  DMA1_Channel4->CCR |= DMA_CCR4_EN;
}

void USART::dmarx_go(uint32_t size)
{
  DMA1_Channel5->CCR &= ~DMA_CCR5_EN;
  DMA1_Channel5->CNDTR = size;
  DMA1->IFCR |= DMA_IFCR_CTCIF5;
  DMA1_Channel5->CCR |= DMA_CCR5_EN;
}

const char *
USART::name()
{
  return USART_DRIVER_DISPLAY_NAME;
}

void USART::disable(void)
{
  switch (channel)
  {
  case 1:
    NVIC_DisableIRQ(USART1_IRQn);
    break;
  case 2:
    NVIC_DisableIRQ(USART2_IRQn);
    break;
  case 3:
    NVIC_DisableIRQ(USART3_IRQn);
    break;
  }
}

void USART::writestr(const char *str)
{
  const char *p = str;
  while (*p)
  {
    while (!(Reg->SR & USART_SR_TXE))
      ;
    Reg->DR = *p++;
  }
  while (Reg->SR & USART_SR_TC)
    ;
}

void USART::write(char ch)
{
  while (!(Reg->SR & USART_SR_TXE))
    ;
  Reg->DR = ch;
  while (Reg->SR & USART_SR_TC)
    ;
}

char USART::read()
{
  while (!(Reg->SR & USART_SR_RXNE))
    ;
  return Reg->DR;
}

void USART::dmarx(uint32_t address)
{
  if (DMA1->ISR & DMA_ISR_TCIF4)
  {
    DMA1->IFCR |= DMA_ISR_TCIF4;
  }
  else if (DMA1->ISR & DMA_ISR_HTIF4)
  {
    DMA1->IFCR |= DMA_ISR_HTIF4;
  }
  else if (DMA1->ISR & DMA_ISR_TEIF4)
  {
    DMA1->IFCR |= DMA_ISR_TEIF4;
  }
}

void USART::dmatx(uint32_t address)
{
  if (DMA1->ISR & DMA_ISR_GIF5)
  {
    DMA1->IFCR |= DMA_ISR_GIF5;
  }
  else if (DMA1->ISR & DMA_ISR_TCIF5)
  {
    DMA1->IFCR |= DMA_ISR_TCIF5;
  }
  else if (DMA1->ISR & DMA_ISR_HTIF5)
  {
    DMA1->IFCR |= DMA_ISR_HTIF5;
  }
  else if (DMA1->ISR & DMA_ISR_TEIF5)
  {
    DMA1->IFCR |= DMA_ISR_TEIF5;
  }
}

void USART::isr(uint32_t address)
{
  if (address)
  {
    DEBUG_LOG("UART IRQ registration: 0x%X\r\n", address);
    next = (USART *)address;
    return;
  }

  DEBUG_LOG("UART ISR entered\r\n");

  if (_SR & USART_SR_RXNE) //receive
  {
    _SR &= ~USART_SR_RXNE;
    volatile uint16_t c = _DR;
    DEBUG_LOG("Read [0x%X]\r\n", c);
    QueuePut((char)c);
  }

  else if (_SR & USART_SR_TC) //transfer
  {
    _SR &= ~USART_SR_TC;
    DEBUG_LOG("Write completed\r\n");
  }
  else if (_SR & USART_SR_CTS)
  {
    _SR &= ~USART_SR_CTS;
  }
  else if (_SR & USART_SR_FE)
  {
    _SR &= ~USART_SR_FE;
    volatile uint16_t tmp = _SR;
    tmp = _DR;
  }
  else if (_SR & USART_SR_IDLE)
  {
    _SR &= ~USART_SR_IDLE;
    volatile uint16_t tmp = _SR;
    tmp = _DR;
    DEBUG_LOG("Idle line\r\n");
  }
  else if (_SR & USART_SR_LBD)
  {
    _SR &= ~USART_SR_LBD;
  }
  else if (_SR & USART_SR_NE)
  {
    _SR &= ~USART_SR_NE;
  }
  else if (_SR & USART_SR_ORE)
  {
    _SR &= ~USART_SR_ORE;
    volatile uint16_t tmp = _SR;
    tmp = _DR;
  }
  else if (_SR & USART_SR_PE)
  {
    _SR &= ~USART_SR_PE;
  }
  else if (_SR & USART_SR_TXE)
  {
    _SR &= ~USART_SR_TXE;
  }

  if (next)
  {
    DEBUG_LOG("UART ISR chaining\r\n");
    USART *n = (USART *)next;
    n->isr(0);
  }
}

void USART::init(char channel, uint32_t baud)
{
  switch (channel)
  {
  case 1:
    RCC->APB2ENR |= RCC_APB2ENR_USART1EN;
    PIN_OUT_ALT_PP(TX1);
    PIN_INPUT_FLOATING(RX1);
    break;
  case 2:
    RCC->APB1ENR |= RCC_APB1ENR_USART2EN;
    PIN_OUT_ALT_PP(TX2);
    PIN_INPUT_FLOATING(RX2);
    break;
  case 3:
    RCC->APB1ENR |= RCC_APB1ENR_USART3EN;
    PIN_OUT_ALT_PP(TX3);
    PIN_INPUT_FLOATING(RX3);
    break;
  }
  int irqnum = UARTirq + channel;

  Reg->BRR = (CRYSTAL_CLOCK + baud / 2) / baud;

  Reg->CR1 &= ~USART_CR1_M;
  Reg->CR2 &= ~USART_CR2_STOP;

  volatile uint16_t __CR1 = Reg->CR1;
  __CR1 |=
      USART_CR1_UE |
      USART_CR1_TE |
      USART_CR1_RE |
      USART_CR1_RXNEIE |
      USART_CR1_PEIE;

  Reg->CR1 = __CR1;

  NVIC_EnableIRQ((IRQn_Type)irqnum);
  NVIC_SetPriority((IRQn_Type)irqnum, 3);
}

void USART::signup()
{
  switch (channel)
  {
  case 1:
    Reg = (USART_TypeDef *)USART1_BASE;
    break;
  case 2:
    Reg = (USART_TypeDef *)USART2_BASE;
    break;
  case 3:
    Reg = (USART_TypeDef *)USART3_BASE;
    break;
  default:
    DEBUG_LOG("Unsupported UART channel\r\n");
    return;
  }

  USART *i = (USART *)HARDWARE_TABLE[USART1_HANDLER];
  if (i)
  {
    DEBUG_LOG("Another instance of UART is registered 0x%X, adding myself 0x%X\r\n", (uint32_t)i, (uint32_t)this);
    i->isr(this);
  }
  else
  {
    DEBUG_LOG("First UART handler registration 0x%X\r\n", (uint32_t)this);
    HARDWARE_TABLE[USART1_HANDLER] = extirq ? (uint32_t)extirq : (uint32_t)this;
  }
}

void USART::signout()
{
  HARDWARE_TABLE[USART1_HANDLER] = next ? (uint32_t)next : 0;
}

uint8_t *USART::get_rx_buf()
{
  return inbuf;
}

uint8_t *USART::get_tx_buf()
{
  return outbuf;
}