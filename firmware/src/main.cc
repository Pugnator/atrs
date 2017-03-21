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
#include <global.hpp>
#include <common.hpp>
#include <log.hpp>
#include <utils/tracker/gpx.hpp>
#include <drivers/gps.hpp>
#include <drivers/storage/fatdisk.hpp>
#include "drivers/gsm.hpp"
#include <core/rtc.hpp>


int main (void)
{
	SEGGER_RTT_WriteString(0, "Started\r\n");
	GSM m(2, 38400);
	m.setup();
	//SEGGER_RTT_printf(0, "Debet: %u\r\n",m.get_account_debet(BEELINE));

	m.get_stations();
	MAIN_END;
	Gps g(1, 9600);
	GPX tr(&g);
	if (!tr.create("log.txt"))
	{
	 MAIN_END;
	}

	for(;;)
	{
		if(tr.set_point())
		{
			BLINK;
		}
		SEGGER_RTT_printf(0, "UTC: %u\r\n", g.get_utc());
		g.correct_rtc();
	}
	tr.commit();
	MAIN_END;
}
