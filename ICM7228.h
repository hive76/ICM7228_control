/*
  LedControl.h - A library for controling Leds with a ICM7218/ICM7228
  Copyright (c) 2010 Mike Hogan / PJ Santoro / Hive76

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

#ifndef ICM7228_h
#define ICM7228_h

#include <WProgram.h>
#include <inttypes.h>

// Pin usage
#define MODE_PIN 2
#define NOT_WRITE_PIN 3

#define COL_1 4
#define COL_2 5
#define COL_3 6
#define COL_4 7
#define COL_5 8
#define COL_6 9
#define COL_7 10
#define COL_8 11

// Note that these pins are the same as COL_1, COL_2, COL_3, COL_8
#define NOT_CODE_B_PIN 4
#define NOT_DECODE_PIN 5
#define NOT_SHUTDOWN_PIN 6
#define DATA_COMING_PIN 11

class ICM7228
{
  private:
    uint8_t _buffer[8];
	static uint8_t _font[][8];

  public:
    ICM7228();
    void writeDot(uint8_t row, uint8_t col, uint8_t dot);
    
    void writeRow(uint8_t row, uint8_t dot);
    void writeCol(uint8_t col, uint8_t dot);
	void scroll(uint8_t letter);
    
    void refresh();
	void controlWord();

};

#endif	//ICM7228.h