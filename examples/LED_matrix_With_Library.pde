// Pin usage
#define COL_3 2
#define COL_5 3
#define COL_6 4
#define COL_4 5
#define COL_2 8
#define COL_1 9
#define COL_0 10
#define COL_7 11

#define NOT_WRITE_PIN 6
#define MODE_PIN 7

// Note that these pins are the same as ID4-ID7
#define NOT_SHUTDOWN_PIN 8
#define NOT_DECODE_PIN 9
#define NOT_CODE_B_PIN 10
#define DATA_COMING_PIN 11

#include <inttypes.h>



class ICM7228
{
  private:
    uint8_t buffer[8];

  public:
    ICM7228();
    void writeDot(uint8_t row, uint8_t col, uint8_t dot);
    
    void writeRow(uint8_t row, uint8_t dot);
    
    void refresh();

};

ICM7228::ICM7228()
{
  int i;
  for(int i=0; i < 8; i++){
      buffer[i]=0;
  }
  pinMode(COL_3, OUTPUT);
  pinMode(COL_5, OUTPUT);
  pinMode(COL_6, OUTPUT);
  pinMode(COL_4, OUTPUT);
  pinMode(COL_2, OUTPUT);
  pinMode(COL_1, OUTPUT);
  pinMode(COL_0, OUTPUT);
  pinMode(COL_7, OUTPUT);
  pinMode(NOT_WRITE_PIN, OUTPUT);
  pinMode(MODE_PIN, OUTPUT);
  
  // Control Mode
  digitalWrite(NOT_WRITE_PIN, HIGH);
  digitalWrite(MODE_PIN, HIGH);

  // Setup control word
  digitalWrite(NOT_SHUTDOWN_PIN, HIGH);  // Normal mode
  digitalWrite(NOT_DECODE_PIN, HIGH); // No Decode mode
  digitalWrite(DATA_COMING_PIN, HIGH); // The data to display will follow

  // Write the control word
  digitalWrite(NOT_WRITE_PIN, LOW);
  digitalWrite(NOT_WRITE_PIN, HIGH);
  
  digitalWrite(MODE_PIN, LOW);  
}

    void ICM7228::writeDot(uint8_t row, uint8_t col, boolean dot)
    {
      uint8_t rowOr =  dot << col;
      uint8_t rowAnd =  ~(1 << col);
      buffer[row] =  (buffer[row] & rowAnd) | rowOr;
    }
    
    void ICM7228::writeRow(uint8_t row, uint8_t dot){}
    
    void ICM7228::refresh()
    {
      for (int ii = 0; ii < 8; ii++){
        digitalWrite(NOT_WRITE_PIN, LOW);
        
        digitalWrite(COL_0, buffer[ii] & 1);
        digitalWrite(COL_1, buffer[ii] & 2); 
        digitalWrite(COL_2, buffer[ii] & 4);
        digitalWrite(COL_3, buffer[ii] & 8);
        digitalWrite(COL_4, buffer[ii] & 0x10);
        digitalWrite(COL_5, buffer[ii] & 0x20);
        digitalWrite(COL_6, buffer[ii] & 0x40);
        digitalWrite(COL_7,!(buffer[ii] & 0x80));
        
        digitalWrite(NOT_WRITE_PIN, HIGH);
      }      
    }




  ICM7228 theICM7228;
void setup()
{

  theICM7228 = ICM7228();
  
  theICM7228.writeDot(3,5,true);
  theICM7228.writeDot(3,7,true);
  theICM7228.refresh();
}


void loop()
{

  delay(2000);
}




void setRegister()
{

}



void loadDisplay(unsigned int n)
{
  if (n == 0){
    digitalWrite(COL_0, 1);
    digitalWrite(COL_1, 0); 
    digitalWrite(COL_2, 0);
    digitalWrite(COL_3, 0);
    digitalWrite(COL_4, 0);
    digitalWrite(COL_5, 0);
    digitalWrite(COL_6, 0);
    digitalWrite(COL_7, 0);
  }
  else if (n == 1){
    digitalWrite(COL_0, 0);
    digitalWrite(COL_1, 1); 
    digitalWrite(COL_2, 0);
    digitalWrite(COL_3, 0);
    digitalWrite(COL_4, 0);
    digitalWrite(COL_5, 0);
    digitalWrite(COL_6, 1);
    digitalWrite(COL_7, 1);
  }
  else if (n == 2){
    digitalWrite(COL_0, 0);
    digitalWrite(COL_1, 0); 
    digitalWrite(COL_2, 1);
    digitalWrite(COL_3, 0);
    digitalWrite(COL_4, 0);
    digitalWrite(COL_5, 1);
    digitalWrite(COL_6, 0);
    digitalWrite(COL_7, 1);
  }
  else if (n == 3){
    digitalWrite(COL_0, 0);
    digitalWrite(COL_1, 0); 
    digitalWrite(COL_2, 0);
    digitalWrite(COL_3, 1);
    digitalWrite(COL_4, 1);
    digitalWrite(COL_5, 0);
    digitalWrite(COL_6, 0);
    digitalWrite(COL_7, 1);
  }
  else if (n == 4){
    digitalWrite(COL_0, 0);
    digitalWrite(COL_1, 0); 
    digitalWrite(COL_2, 0);
    digitalWrite(COL_3, 1);
    digitalWrite(COL_4, 1);
    digitalWrite(COL_5, 0);
    digitalWrite(COL_6, 0);
    digitalWrite(COL_7, 1);
  }
  else if (n == 5){
    digitalWrite(COL_0, 0);
    digitalWrite(COL_1, 0); 
    digitalWrite(COL_2, 1);
    digitalWrite(COL_3, 0);
    digitalWrite(COL_4, 0);
    digitalWrite(COL_5, 1);
    digitalWrite(COL_6, 0);
    digitalWrite(COL_7, 1);
  }
  else if (n == 6){
    digitalWrite(COL_0, 0);
    digitalWrite(COL_1, 1); 
    digitalWrite(COL_2, 0);
    digitalWrite(COL_3, 0);
    digitalWrite(COL_4, 0);
    digitalWrite(COL_5, 0);
    digitalWrite(COL_6, 1);
    digitalWrite(COL_7, 1);
  }
  else if (n == 7){
    digitalWrite(COL_0, 1);
    digitalWrite(COL_1, 0); 
    digitalWrite(COL_2, 0);
    digitalWrite(COL_3, 0);
    digitalWrite(COL_4, 0);
    digitalWrite(COL_5, 0);
    digitalWrite(COL_6, 0);
    digitalWrite(COL_7, 0);
  }
  else
    clearDigits();
}



void writeDigit()
{  
  digitalWrite(NOT_WRITE_PIN, LOW);
  digitalWrite(NOT_WRITE_PIN, HIGH);
}




void clearDigits()
{
  digitalWrite(COL_0, 0);
  digitalWrite(COL_1, 0); 
  digitalWrite(COL_2, 0);
  digitalWrite(COL_3, 0);
  digitalWrite(COL_4, 0);
  digitalWrite(COL_5, 0);
  digitalWrite(COL_6, 0);
  digitalWrite(COL_7, 1);

  digitalWrite(NOT_WRITE_PIN, LOW);
  digitalWrite(NOT_WRITE_PIN, HIGH);
}


