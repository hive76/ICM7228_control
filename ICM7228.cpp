/*
  ICM7228.cpp - A library for controling LEDs with a ICM7218/ICM7228
  Copyright (c) 2010 PJ Santoro / Mike Hogan /Hive76

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

#include <WProgram.h>
#include "ICM7228.h"

/******************************************************************************
 * Constructors
 ******************************************************************************/
 
ICM7228::ICM7228(uint8_t nw, uint8_t mode, 
			uint8_t id0, uint8_t id1, uint8_t id2, uint8_t id3,
			uint8_t id4, uint8_t id5, uint8_t id6, uint8_t id7){

	// pins for control
	_notWritePin = nw;
	_modePin = mode;

	// pins for display data and some for control
	_dataPins[0] = id0;
	_dataPins[1] = id1;
	_dataPins[2] = id2;
	_dataPins[3] = _ramBankSelect = id3;
	_dataPins[4] = _notShutdownPin = id4;
	_dataPins[5] = _notDecodePin = id5;
	_dataPins[6] = _notCodeBPin = id6;
	_dataPins[7] = _dataComingPin = id7;

	// sets up buffer to store display data
	for(int i=0; i < 8; i++){
	  _buffer[i]=0;
	}

	//sets direction of control pins
	pinMode(_notWritePin, OUTPUT);
	pinMode(_modePin, OUTPUT);
	
	// sets direction of data pins
	for (int ii = 0; ii < 8; ii++) {
		pinMode(_dataPins[ii], OUTPUT);
	}

}

														// Move this to it's own header file
byte ICM7228::_font[][8]={
	{0x00, 0x7C, 0xC6, 0xCC, 0xC6, 0xDC, 0x00, 0x00},	// Char 000 (beta)
    {0x00, 0x38, 0x6C, 0xC6, 0xFE, 0xC6, 0x00, 0x00},	// Char 001 (A)
    {0x00, 0xFC, 0xC6, 0xFE, 0xC6, 0xFC, 0x00, 0x00},	// Char 002 (B)
    {0x00, 0x7E, 0xC0, 0xC0, 0xC0, 0x7E, 0x00, 0x00},	// Char 003 (C)
    {0x00, 0xFC, 0xC6, 0xC6, 0xC6, 0xFC, 0x00, 0x00},	// Char 004 (D)
    {0x00, 0xFE, 0xC0, 0xF8, 0xC0, 0xFE, 0x00, 0x00},	// Char 005 (E)
    {0x00, 0xFE, 0xC0, 0xF8, 0xC0, 0xC0, 0x00, 0x00},	// Char 006 (F)
    {0x00, 0x7E, 0xC0, 0xCE, 0xC6, 0x7E, 0x00, 0x00},	// Char 007 (G)
    {0x00, 0xC6, 0xC6, 0xFE, 0xC6, 0xC6, 0x00, 0x00},	// Char 008 (H)
    {0x00, 0x7E, 0x18, 0x18, 0x18, 0x7E, 0x00, 0x00},	// Char 009 (I)
    {0x00, 0x0E, 0x06, 0x06, 0x0E, 0x7C, 0x00, 0x00},	// Char 010 (J)
    {0x00, 0xC6, 0xCC, 0xF8, 0xCC, 0xC6, 0x00, 0x00},	// Char 011 (K)
    {0x00, 0x60, 0x60, 0x60, 0x60, 0x7E, 0x00, 0x00},	// Char 012 (L)
    {0x00, 0xC6, 0xEE, 0xFE, 0xD6, 0xC6, 0x00, 0x00},	// Char 013 (M)
    {0x00, 0xC6, 0xF6, 0xFE, 0xDE, 0xC6, 0x00, 0x00},	// Char 014 (N)
    {0x00, 0x38, 0xC6, 0xC6, 0xC6, 0x38, 0x00, 0x00},	// Char 015 (O)
    {0x00, 0xFC, 0xC6, 0xFC, 0xC0, 0xC0, 0x00, 0x00},	// Char 016 (P)
    {0x00, 0x7C, 0xC6, 0xC6, 0xDE, 0x7C, 0x0C, 0x00},	// Char 017 (Q)
    {0x00, 0xFC, 0xC6, 0xFE, 0xCC, 0xC6, 0x00, 0x00},	// Char 018 (R)
    {0x00, 0x7E, 0xC0, 0x7C, 0x06, 0xFC, 0x00, 0x00},	// Char 019 (S)
    {0x00, 0x7E, 0x18, 0x18, 0x18, 0x18, 0x00, 0x00},	// Char 020 (T)
    {0x00, 0xC6, 0xC6, 0xC6, 0xC6, 0x7C, 0x00, 0x00},	// Char 021 (U)
    {0x00, 0xC6, 0xC6, 0xC6, 0x6C, 0x38, 0x00, 0x00},	// Char 022 (V)
    {0x00, 0xC6, 0xD6, 0xFE, 0xEE, 0xC6, 0x00, 0x00},	// Char 023 (W)
    {0x00, 0xC6, 0x6C, 0x38, 0x6C, 0xC6, 0x00, 0x00},	// Char 024 (X)
    {0x00, 0x66, 0x3C, 0x18, 0x18, 0x18, 0x00, 0x00},	// Char 025 (Y)
    {0x00, 0xFE, 0x0E, 0x38, 0xE0, 0xFE, 0x00, 0x00},	// Char 026 (Z)
    {0x00, 0x3C, 0x30, 0x30, 0x30, 0x30, 0x30, 0x3C},	// Char 027 ([)
    {0x00, 0x3C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x3C},	// Char 028 (])
    {0x18, 0x18, 0x18, 0x18, 0x00, 0x18, 0x00, 0x00},	// Char 029 (!)
    {0x00, 0x36, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x00},	// Char 030 (")
    {0x00, 0x0C, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00},	// Char 031 (')
    {0x0E, 0x1C, 0x38, 0x30, 0x30, 0x38, 0x1C, 0x0E},	// Char 032 (()
    {0x70, 0x38, 0x1C, 0x0C, 0x0C, 0x1C, 0x38, 0x70},	// Char 033 ())
    {0x08, 0x4A, 0x2C, 0xE0, 0x07, 0x34, 0x52, 0x10},   // Char 034 (*)
    {0x00, 0x10, 0x10, 0x7C, 0x10, 0x10, 0x00, 0x00},	// Char 035 (+)
    {0x00, 0x00, 0x00, 0x00, 0x18, 0x30, 0x00, 0x00},	// Char 036 (,)
    {0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x00},	// Char 037 (-)
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x18, 0x00},	// Char 038 (.)
    {0x00, 0xC0, 0xE0, 0x70, 0x38, 0x1C, 0x0E, 0x06},	// Char 039 (\)
    {0x00, 0x7C, 0xE6, 0xEE, 0xF6, 0xFE, 0xFE, 0x7C},	// Char 040 (0)
    {0x00, 0x38, 0x78, 0x38, 0x38, 0xFE, 0xFE, 0xFE},	// Char 041 (1)
    {0x00, 0x7C, 0xCE, 0x1C, 0x78, 0xFE, 0xFE, 0xFE},	// Char 042 (2)
    {0x00, 0x7E, 0x06, 0x1C, 0xC6, 0xFE, 0xFE, 0x7C},	// Char 043 (3)
    {0x00, 0x1C, 0x3C, 0x7C, 0xDC, 0xFE, 0xFE, 0x1C},	// Char 044 (4)
    {0x00, 0xFE, 0xE0, 0xFC, 0x06, 0xE6, 0xFE, 0x7C},	// Char 045 (5)
    {0x00, 0xFE, 0xC0, 0xFE, 0xC6, 0xFE, 0x00, 0x00},	// Char 046 (6)
    {0x00, 0xFE, 0x0C, 0x18, 0x30, 0x60, 0x00, 0x00},	// Char 047 (7)
    {0x00, 0x7C, 0xEE, 0x7C, 0xEE, 0xFE, 0xFE, 0x7C},	// Char 048 (8)
    {0x00, 0x7C, 0xE6, 0x7E, 0x0E, 0xFE, 0xFC, 0xF8},	// Char 049 (9)
    {0x00, 0x00, 0x18, 0x00, 0x18, 0x00, 0x00, 0x00},	// Char 050 (:)
    {0x00, 0x3C, 0x6E, 0x6E, 0x0C, 0x00, 0x18, 0x18},	// Char 051 (?)
	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},	// Char 052 (Sp)
	{0x89, 0x5A, 0x24, 0xDA, 0x5B, 0x24, 0x5A, 0x91},	// Char 053 (SnFlake1)
	{0x91, 0x5A, 0x24, 0x5B, 0xDA, 0x24, 0x5A, 0x89},	// Char 054 (SnFlake2)
	{0x42, 0xDB, 0x24, 0x6A, 0x56, 0x24, 0xDB, 0x42},	// Char 055 (SnFlake3)
	{0x42, 0xDB, 0x2C, 0x52, 0x4A, 0x34, 0xDB, 0x42}	// Char 056 (SnFlake4)
};

/******************************************************************************
 * ICM7228 Configuration
 ******************************************************************************/
 
 // Sets Control Register
 void ICM7228::controlWord(boolean ramBank, boolean shutdown, boolean decode, boolean codeB, boolean data)
{
  // Control Mode
  digitalWrite(_notWritePin, HIGH);
  digitalWrite(_dataComingPin, LOW);
  digitalWrite(_modePin, HIGH);

  // Setup control word
  digitalWrite(_ramBankSelect, ramBank);	// Selects which bank to get display data from (decode mode only)
  digitalWrite(_notShutdownPin, shutdown); 	// Normal mode
  digitalWrite(_notDecodePin, decode);    // No Decode mode
  digitalWrite(_notCodeBPin, codeB);     	// Not actually being used, just setting to known state
  digitalWrite(_dataComingPin, data);   // The data to display will follow


  // Write the control word
  digitalWrite(_notWritePin, LOW);
  digitalWrite(_notWritePin, HIGH);
}

// Sets Display RAM; Sequential 8 Digit Update
void ICM7228::write8bytes()
{
  // Get ready to load Display RAM
  digitalWrite(_modePin, LOW);
  
	for (int ii = 0; ii < 8; ii++){
		digitalWrite(_notWritePin, LOW);

		digitalWrite(_dataPins[6], _buffer[ii] & 0x80);
		digitalWrite(_dataPins[5], _buffer[ii] & 0x40); 
		digitalWrite(_dataPins[4], _buffer[ii] & 0x20);
		digitalWrite(_dataPins[0], _buffer[ii] & 0x10);
		digitalWrite(_dataPins[3], _buffer[ii] & 0x08);
		digitalWrite(_dataPins[1], _buffer[ii] & 0x04);
		digitalWrite(_dataPins[2], _buffer[ii] & 0x02);
		digitalWrite(_dataPins[7], !(_buffer[ii] & 0x01));

		digitalWrite(_notWritePin, HIGH);
	}      
}

// Puts the ICM7228 in shutdown mode
void ICM7228::shutdown()
{
	// Send control word with the shutdown pin (ID4) to low
	controlWord(0, 0, 1, 0, 1);
}



/******************************************************************************
 * User Functions
 ******************************************************************************/
 
void ICM7228::writeDot(uint8_t row, uint8_t col, boolean dot){		// A function to display a single pixel on a matrix
	uint8_t rowOr =  dot << col;
	uint8_t rowAnd =  ~(0x80 << col);
	
	//controlWord();
	_buffer[row] =  (_buffer[row] & rowAnd) | rowOr;
	//write8bytes();
}
    
void ICM7228::writeRow(uint8_t row, uint8_t dots){					// A function to display specific LEDs within a row on a matrix
	//controlWord();
	_buffer[row] =  dots;
	//write8bytes();
}

void ICM7228::writeCol(uint8_t col, uint8_t dots){					// A function to display specific LEDs within a column on a matrix
	uint8_t colBit =  (0x80 >> (col-1));							// Creates a byte with a 1 in the corresponding "column." ex. if col = 3, then colBit = 00100000
	int colBitNum = 0;                               				// Tells which bit in the colBit byte is "on." ex. if col = 3, then colBit = 0010000, and colBitNum = 5

	controlWord(0, 1, 1, 0, 1);
    for (boolean y = 0; y != 1; colBitNum++){      					// Reads through colBit to figure out the (bit number of "on" bit + 1)
	  y = ((colBit >> colBitNum) & 0x01);
	}

	for (int x = 0; x < 8; x++){
      int yy = ((dots << x) & 0x80);
      _buffer[x] = (yy >> (col-1));
	}
	write8bytes();
}

void ICM7228::scrollRight(uint8_t letter){
  
	for (int i = 0; i < 12; i++){
      controlWord(0, 1, 1, 0, 1);
    
	  for (int ii = 0; ii < 8; ii++){
		if (((_font[letter][ii] << i) & 0x80) == 0){
		  _buffer[ii] &= ~(1 << 0);
		}
		else {
		  _buffer[ii] |= (1 << 0);
		}
		writeRow(ii, _buffer[ii]);
		_buffer[ii] <<= 1;
	  }
	  write8bytes();
	  delay(50);
	}
 }