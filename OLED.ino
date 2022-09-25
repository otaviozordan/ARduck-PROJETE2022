#include <Arduino.h>
#include <Wire.h>
#include <MicroLCD.h>

LCD_SSD1306 lcd; 

const PROGMEM uint8_t coracao[48 * 48 / 8] = {
0x00, 0x00, 0x80, 0xC0, 0xE0, 0x70, 0x30, 0x18, 0x18, 0x1C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C,
0x0C, 0x18, 0x18, 0x30, 0x70, 0xE0, 0xC0, 0x80, 0x80, 0xC0, 0xE0, 0x70, 0x30, 0x18, 0x18, 0x0C,
0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x1C, 0x18, 0x18, 0x30, 0x70, 0xE0, 0xC0, 0x80, 0x00, 0x00,
0xF8, 0xFE, 0x0F, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x07, 0x07, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x0F, 0xFE, 0xF8,
0x07, 0x1F, 0x7C, 0xF0, 0xC0, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xF0, 0x7C, 0x1F, 0x07,
0x00, 0x00, 0x00, 0x00, 0x01, 0x03, 0x07, 0x0E, 0x1C, 0x30, 0xE0, 0xC0, 0x80, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x80, 0xC0, 0xE0, 0x70, 0x1C, 0x0E, 0x07, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03, 0x07, 0x0E, 0x1C,
0x38, 0x70, 0xE0, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0x70, 0x38,
0x1C, 0x0E, 0x07, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x03, 0x07, 0x0E, 0x1C, 0x38, 0x38, 0x1C, 0x0E, 0x07, 0x03, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

void setup()
{
  Serial.begin (9600);
  lcd.begin();

  lcd.clear();
  lcd.setCursor(40,1);
  lcd.draw(coracao,48,48);
  delay(6000);

}

void loop()
{
  lcd.clear();
  lcd.setCursor(40, 1);
  lcd.draw(coracao, 48, 48);
  delay(3000);
  
  lcd.clear();
  lcd.setFontSize(FONT_SIZE_MEDIUM);
  lcd.println("  ");
  lcd.println("  CONECTANDO");
  lcd.println("    A REDE  ");
  delay(1000);

  lcd.clear();
  lcd.setFontSize(FONT_SIZE_MEDIUM);
  lcd.println("  ");
  lcd.println("AGUARDANDO");
  lcd.println("AS MEDICOES...");
  delay(1000);
 
}
