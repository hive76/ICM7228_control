/*
  ICM7228.h - A library for controling LEDs with a ICM7218/ICM7228
  Copyright (c) 2010 PJ Santoro / Mike Hogan / Hive76

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

class ICM7228
{
  private:
    static uint8_t _font[][8];	// This will probably be moved out when the font info is moved out

	uint8_t _buffer[8];

	uint8_t _dataPins[8];

	uint8_t _ramBankSelect;		// data pin id3
	uint8_t _notShutdownPin;	// data pin id4
	uint8_t _notDecodePin;		// data pin id5
	uint8_t _notCodeBPin;		// data pin id6
	uint8_t _dataComingPin;		// data pin id7

	uint8_t _notWritePin;
	uint8_t _modePin;

  public:
    ICM7228(uint8_t nw, uint8_t mode, 
			uint8_t id0, uint8_t id1, uint8_t id2, uint8_t id3,
			uint8_t id4, uint8_t id5, uint8_t id6, uint8_t id7);
			
    void writeDot(uint8_t row, uint8_t col, boolean dot);
    void writeRow(uint8_t row, uint8_t dot);
    void writeCol(uint8_t col, uint8_t dot);
	void scrollRight(uint8_t displayData);
	//void scrollLeft(uint8_t displayData);  add this for scrolling left
	
	void controlWord(boolean ramBank, boolean shutdown, boolean decode, boolean codeB, boolean data);
	void write8bytes();
	void shutdown();
};

#endif	//ICM7228.h