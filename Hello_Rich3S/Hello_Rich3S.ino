/*********
  Rui Santos
  Complete project details at https://randomnerdtutorials.com  
*********/

#include <LiquidCrystal_I2C.h>

// set the LCD number of columns and rows
int lcdColumns = 20;
int lcdRows = 4;

// set LCD address, number of columns and rows
// if you don't know your display address, run an I2C scanner sketch
LiquidCrystal_I2C lcd(0x27, lcdColumns, lcdRows);  
String messageStatic = "We are........";
String messageToScroll = "Ridma, Chamodi, Sasindu, Sithum, Saliya.........";

void scrollText(int row, String message, int delayTime, int lcdColumns) {
  for (int i=0; i < lcdColumns; i++) {
    message = " " + message;  
  } 
  message = message + " "; 
  for (int pos = 0; pos < message.length(); pos++) {
    lcd.setCursor(0, row);
    lcd.print(message.substring(pos, pos + lcdColumns));
    delay(delayTime);
  }
}

void setup(){
  // initialize LCD
  lcd.init();
  // turn on LCD backlight                      
  lcd.backlight();
}

void loop(){
  // set cursor to first column, first row
  lcd.setCursor(0, 0);
  // print message
  lcd.print("Hello, RICH3S!");
  delay(1000);
  // clears the display to print new message
  lcd.clear();
  // set cursor to first column, second row
  lcd.setCursor(0,1);
  lcd.print("Welcome To");
  delay(1000);
  lcd.clear();
  lcd.setCursor(1,2);
  lcd.print("EnergyEffix System!");
  delay(1000);
  lcd.clear();
  // set cursor to first column, first row
  lcd.setCursor(0, 0);
  // print static message
  lcd.print(messageStatic);
  // print scrolling message
  scrollText(1, messageToScroll, 250, lcdColumns);
  delay(1000);
  lcd.clear(); 
}
