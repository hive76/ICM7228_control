#include <ICM7228.h>

ICM7228 GreenICM7228 = ICM7228(2, 7, 10, 9, 11, 12, 8, 5, 4, 6);
ICM7228 RedICM7228 = ICM7228(3, 7, 10, 9, 11, 12, 8, 5, 4, 6);

const int leftButtonPin = 19;
const int rightButtonPin = 18;
const int brakesPin = 17;

void setup()
{
  pinMode(leftButtonPin,INPUT);
  pinMode(rightButtonPin,INPUT);
  pinMode(brakesPin, INPUT);
}

void loop()
{
  //loop forever waiting for input from left button or right button
  //take appropriate action when button is pressed
  
  // if left is pressed
  if (digitalRead(leftButtonPin) == HIGH){
    //do this
    leftArrow();
  }
  // if right is pressed
  if (digitalRead(rightButtonPin) == HIGH){
    //do this
    rightArrow();
  }
  // if the brakes are squeezed
  if (digitalRead(brakesPin) == HIGH){
    //do this
    stopSign();
  }
}


void leftArrow(){
  
for (int i=0; i < 3; i++){
    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x01);    //
    GreenICM7228.writeRow(3, 0x01);    // Displays a Right Arrow.1
    GreenICM7228.writeRow(4, 0x01);    //
    GreenICM7228.writeRow(5, 0x01);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0x00);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x03);    //
    GreenICM7228.writeRow(3, 0x03);    // Displays a Right Arrow.2
    GreenICM7228.writeRow(4, 0x03);    //
    GreenICM7228.writeRow(5, 0x03);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0x00);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x07);    //
    GreenICM7228.writeRow(3, 0x07);    // Displays a Right Arrow.3
    GreenICM7228.writeRow(4, 0x07);    //
    GreenICM7228.writeRow(5, 0x07);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0x00);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x0F);    //
    GreenICM7228.writeRow(3, 0x0F);    // Displays a Right Arrow.4
    GreenICM7228.writeRow(4, 0x0F);    //
    GreenICM7228.writeRow(5, 0x0F);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0x00);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x10);    //
    GreenICM7228.writeRow(1, 0x10);    //
    GreenICM7228.writeRow(2, 0x1F);    //
    GreenICM7228.writeRow(3, 0x1F);    // Displays a Right Arrow.5
    GreenICM7228.writeRow(4, 0x1F);    //
    GreenICM7228.writeRow(5, 0x1F);    //
    GreenICM7228.writeRow(6, 0x10);    //
    GreenICM7228.writeRow(7, 0X10);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x10);    //
    GreenICM7228.writeRow(1, 0x30);    //
    GreenICM7228.writeRow(2, 0x3F);    //
    GreenICM7228.writeRow(3, 0x3F);    // Displays a Right Arrow.6
    GreenICM7228.writeRow(4, 0x3F);    //
    GreenICM7228.writeRow(5, 0x3F);    //
    GreenICM7228.writeRow(6, 0x30);    //
    GreenICM7228.writeRow(7, 0X10);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x10);    //
    GreenICM7228.writeRow(1, 0x30);    //
    GreenICM7228.writeRow(2, 0x7F);    //
    GreenICM7228.writeRow(3, 0x7F);    // Displays a Right Arrow.7
    GreenICM7228.writeRow(4, 0x7F);    //
    GreenICM7228.writeRow(5, 0x7F);    //
    GreenICM7228.writeRow(6, 0x30);    //
    GreenICM7228.writeRow(7, 0X10);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x10);    //
    GreenICM7228.writeRow(1, 0x30);    //
    GreenICM7228.writeRow(2, 0x7F);    //
    GreenICM7228.writeRow(3, 0xFF);    // Displays a Left Arrow.8
    GreenICM7228.writeRow(4, 0xFF);    //
    GreenICM7228.writeRow(5, 0x7F);    //
    GreenICM7228.writeRow(6, 0x30);    //
    GreenICM7228.writeRow(7, 0X10);    //
    GreenICM7228.write8bytes();
    delay(100);
    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x00);    //
    GreenICM7228.writeRow(3, 0x00);    // Displays a Left Arrow.off
    GreenICM7228.writeRow(4, 0x00);    //
    GreenICM7228.writeRow(5, 0x00);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0X00);    //
    GreenICM7228.write8bytes();
    delay(200);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x10);    //
    GreenICM7228.writeRow(1, 0x30);    //
    GreenICM7228.writeRow(2, 0x7F);    //
    GreenICM7228.writeRow(3, 0xFF);    // Displays a Left Arrow.flash
    GreenICM7228.writeRow(4, 0xFF);    //
    GreenICM7228.writeRow(5, 0x7F);    //
    GreenICM7228.writeRow(6, 0x30);    //
    GreenICM7228.writeRow(7, 0X10);    //
    GreenICM7228.write8bytes();
    delay(100);
    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x00);    //
    GreenICM7228.writeRow(3, 0x00);    // Displays a Left Arrow.off
    GreenICM7228.writeRow(4, 0x00);    //
    GreenICM7228.writeRow(5, 0x00);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0X00);    //
    GreenICM7228.write8bytes();
    delay(200);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x10);    //
    GreenICM7228.writeRow(1, 0x30);    //
    GreenICM7228.writeRow(2, 0x7F);    //
    GreenICM7228.writeRow(3, 0xFF);    // Displays a Left Arrow.flash
    GreenICM7228.writeRow(4, 0xFF);    //
    GreenICM7228.writeRow(5, 0x7F);    //
    GreenICM7228.writeRow(6, 0x30);    //
    GreenICM7228.writeRow(7, 0X10);    //
    GreenICM7228.write8bytes();
    delay(100);
    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x00);    //
    GreenICM7228.writeRow(3, 0x00);    // Displays a Left Arrow.off
    GreenICM7228.writeRow(4, 0x00);    //
    GreenICM7228.writeRow(5, 0x00);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0X00);    //
    GreenICM7228.write8bytes();
    delay(200);
    GreenICM7228.shutdown();
  }
}

void rightArrow(){
  
for (int i=0; i < 3; i++){ 
    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x80);    //
    GreenICM7228.writeRow(3, 0x80);    // Displays a Right Arrow.1
    GreenICM7228.writeRow(4, 0x80);    //
    GreenICM7228.writeRow(5, 0x80);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0x00);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0xC0);    //
    GreenICM7228.writeRow(3, 0xC0);    // Displays a Right Arrow.2
    GreenICM7228.writeRow(4, 0xC0);    //
    GreenICM7228.writeRow(5, 0xC0);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0x00);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0xE0);    //
    GreenICM7228.writeRow(3, 0xE0);    // Displays a Right Arrow.3
    GreenICM7228.writeRow(4, 0xE0);    //
    GreenICM7228.writeRow(5, 0xE0);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0x00);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0xF0);    //
    GreenICM7228.writeRow(3, 0xF0);    // Displays a Right Arrow.4
    GreenICM7228.writeRow(4, 0xF0);    //
    GreenICM7228.writeRow(5, 0xF0);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0x00);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x08);    //
    GreenICM7228.writeRow(1, 0x08);    //
    GreenICM7228.writeRow(2, 0xF8);    //
    GreenICM7228.writeRow(3, 0xF8);    // Displays a Right Arrow.5
    GreenICM7228.writeRow(4, 0xF8);    //
    GreenICM7228.writeRow(5, 0xF8);    //
    GreenICM7228.writeRow(6, 0x08);    //
    GreenICM7228.writeRow(7, 0X08);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x08);    //
    GreenICM7228.writeRow(1, 0x0C);    //
    GreenICM7228.writeRow(2, 0xFC);    //
    GreenICM7228.writeRow(3, 0xFC);    // Displays a Right Arrow.6
    GreenICM7228.writeRow(4, 0xFC);    //
    GreenICM7228.writeRow(5, 0xFC);    //
    GreenICM7228.writeRow(6, 0x0C);    //
    GreenICM7228.writeRow(7, 0X08);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x08);    //
    GreenICM7228.writeRow(1, 0x0C);    //
    GreenICM7228.writeRow(2, 0xFE);    //
    GreenICM7228.writeRow(3, 0xFE);    // Displays a Right Arrow.7
    GreenICM7228.writeRow(4, 0xFE);    //
    GreenICM7228.writeRow(5, 0xFE);    //
    GreenICM7228.writeRow(6, 0x0C);    //
    GreenICM7228.writeRow(7, 0X08);    //
    GreenICM7228.write8bytes();
    delay(100);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x08);    //
    GreenICM7228.writeRow(1, 0x0C);    //
    GreenICM7228.writeRow(2, 0xFE);    //
    GreenICM7228.writeRow(3, 0xFF);    // Displays a Right Arrow.8
    GreenICM7228.writeRow(4, 0xFF);    //
    GreenICM7228.writeRow(5, 0xFE);    //
    GreenICM7228.writeRow(6, 0x0C);    //
    GreenICM7228.writeRow(7, 0X08);    //
    GreenICM7228.write8bytes();
    delay(100);
    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x00);    //
    GreenICM7228.writeRow(3, 0x00);    // Displays a Right Arrow.off
    GreenICM7228.writeRow(4, 0x00);    //
    GreenICM7228.writeRow(5, 0x00);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0X00);    //
    GreenICM7228.write8bytes();
    delay(200);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x08);    //
    GreenICM7228.writeRow(1, 0x0C);    //
    GreenICM7228.writeRow(2, 0xFE);    //
    GreenICM7228.writeRow(3, 0xFF);    // Displays a Right Arrow.flash
    GreenICM7228.writeRow(4, 0xFF);    //
    GreenICM7228.writeRow(5, 0xFE);    //
    GreenICM7228.writeRow(6, 0x0C);    //
    GreenICM7228.writeRow(7, 0X08);    //
    GreenICM7228.write8bytes();
    delay(100);
    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x00);    //
    GreenICM7228.writeRow(3, 0x00);    // Displays a Right Arrow.off
    GreenICM7228.writeRow(4, 0x00);    //
    GreenICM7228.writeRow(5, 0x00);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0X00);    //
    GreenICM7228.write8bytes();
    delay(200);

    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x08);    //
    GreenICM7228.writeRow(1, 0x0C);    //
    GreenICM7228.writeRow(2, 0xFE);    //
    GreenICM7228.writeRow(3, 0xFF);    // Displays a Right Arrow.flash
    GreenICM7228.writeRow(4, 0xFF);    //
    GreenICM7228.writeRow(5, 0xFE);    //
    GreenICM7228.writeRow(6, 0x0C);    //
    GreenICM7228.writeRow(7, 0X08);    //
    GreenICM7228.write8bytes();
    delay(100);
    GreenICM7228.controlWord(0, 1, 1, 0, 1);        //
    GreenICM7228.writeRow(0, 0x00);    //
    GreenICM7228.writeRow(1, 0x00);    //
    GreenICM7228.writeRow(2, 0x00);    //
    GreenICM7228.writeRow(3, 0x00);    // Displays a Right Arrow.off
    GreenICM7228.writeRow(4, 0x00);    //
    GreenICM7228.writeRow(5, 0x00);    //
    GreenICM7228.writeRow(6, 0x00);    //
    GreenICM7228.writeRow(7, 0X00);    //
    GreenICM7228.write8bytes();
    delay(200);
    GreenICM7228.shutdown();
  }
}
  
  void stopSign(){
    RedICM7228.controlWord(0, 1, 1, 0, 1);        //
    RedICM7228.writeRow(0, 0x18);    //
    RedICM7228.writeRow(1, 0x3c);    //
    RedICM7228.writeRow(2, 0x7e);    //
    RedICM7228.writeRow(3, 0xff);    // Displays a Stop sign
    RedICM7228.writeRow(4, 0xff);    //
    RedICM7228.writeRow(5, 0x7e);    //
    RedICM7228.writeRow(6, 0x3c);    //
    RedICM7228.writeRow(7, 0X18);    //
    RedICM7228.write8bytes();
    delay(200);
    RedICM7228.controlWord(0, 1, 1, 0, 1);        //
    RedICM7228.writeRow(0, 0x00);    //
    RedICM7228.writeRow(1, 0x00);    //
    RedICM7228.writeRow(2, 0x00);    //
    RedICM7228.writeRow(3, 0x00);    // Displays a Stop sign.off
    RedICM7228.writeRow(4, 0x00);    //
    RedICM7228.writeRow(5, 0x00);    //
    RedICM7228.writeRow(6, 0x00);    //
    RedICM7228.writeRow(7, 0X00);    //
    RedICM7228.write8bytes();
    delay(200);
    RedICM7228.controlWord(0, 1, 1, 0, 1);        //
    RedICM7228.writeRow(0, 0x18);    //
    RedICM7228.writeRow(1, 0x3c);    //
    RedICM7228.writeRow(2, 0x7e);    //
    RedICM7228.writeRow(3, 0xff);    // Displays a Stop sign
    RedICM7228.writeRow(4, 0xff);    //
    RedICM7228.writeRow(5, 0x7e);    //
    RedICM7228.writeRow(6, 0x3c);    //
    RedICM7228.writeRow(7, 0X18);    //
    RedICM7228.write8bytes();
    delay(200);
    RedICM7228.controlWord(0, 1, 1, 0, 1);        //
    RedICM7228.writeRow(0, 0x00);    //
    RedICM7228.writeRow(1, 0x00);    //
    RedICM7228.writeRow(2, 0x00);    //
    RedICM7228.writeRow(3, 0x00);    // Displays a Stop sign.off
    RedICM7228.writeRow(4, 0x00);    //
    RedICM7228.writeRow(5, 0x00);    //
    RedICM7228.writeRow(6, 0x00);    //
    RedICM7228.writeRow(7, 0X00);    //
    RedICM7228.write8bytes();
    delay(200);
    RedICM7228.shutdown();
  }
