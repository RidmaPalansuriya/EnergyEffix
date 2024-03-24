#include <LiquidCrystal_I2C.h>
#include "EmonLib.h"
#include <EEPROM.h>
#include <WiFi.h>
#include <HTTPClient.h>

LiquidCrystal_I2C lcd(0x27, 20, 4);
EnergyMonitor emon;

#define vCalibration 83.3
#define currCalibration 0.50

char ssid[] = "SLT-4G-738D";
char pass[] = "B73L0L3MGE6";

float kWh = 0;
unsigned long lastmillis = millis();

void sendDataToServer(float Vrms, float Irms, float Power, float kWh) {
 HTTPClient http;
 String serverPath = "http://192.168.1.101/EnergyEffix%20Meter%20Database/index.php";
 http.begin(serverPath);
 http.addHeader("Content-Type", "application/x-www-form-urlencoded");
 String httpRequestData = "Vrms=" + String(Vrms) + "&Irms=" + String(Irms) + "&Power=" + String(Power) + "&kWh=" + String(kWh);
 int httpResponseCode = http.POST(httpRequestData);

 if (httpResponseCode>0) {
    String response = http.getString();
    Serial.println(httpResponseCode);
    Serial.println(response);
 } else {
    Serial.print("Error on sending POST: ");
    Serial.println(httpResponseCode);
 }

 http.end();
}

void setup() {
 Serial.begin(115200);
 WiFi.begin(ssid, pass);
 while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
 }
 Serial.println("Connected to WiFi");

 lcd.init();
 lcd.backlight();
 emon.voltage(35, vCalibration, 1.7);
 emon.current(34, currCalibration);

 lcd.setCursor(0, 0);
 lcd.print("Starting.....");
 lcd.setCursor(5, 2);
 lcd.print("EnergyEffix!");
 delay(3000);
 lcd.clear();
}

void loop() {
 emon.calcVI(20, 2000);
 kWh = kWh + emon.apparentPower * (millis() - lastmillis) / 3600000000.0;
 yield();

 Serial.print("Vrms: ");
 Serial.print(emon.Vrms, 2);
 Serial.print("V");
 EEPROM.put(0, emon.Vrms);
 delay(100);

 Serial.print("\tIrms: ");
 Serial.print(emon.Irms, 4);
 Serial.print("A");
 EEPROM.put(4, emon.Irms);
 delay(100);

 Serial.print("\tPower: ");
 Serial.print(emon.apparentPower, 4);
 Serial.print("W");
 EEPROM.put(8, emon.apparentPower);
 delay(100);

 Serial.print("\tkWh: ");
 Serial.print(kWh, 5);
 Serial.println("kWh");
 EEPROM.put(12, kWh);

 lcd.clear();
 lcd.setCursor(0, 0);
 lcd.print("Vrms:");
 lcd.print(emon.Vrms, 2);
 lcd.print("V");
 lcd.setCursor(0, 1);
 lcd.print("Irms:");
 lcd.print(emon.Irms, 4);
 lcd.print("A");
 lcd.setCursor(0, 2);
 lcd.print("Power:");
 lcd.print(emon.apparentPower, 4);
 lcd.print("W");
 lcd.setCursor(0, 3);
 lcd.print("kWh:");
 lcd.print(kWh, 4);
 lcd.print("W");

 sendDataToServer(emon.Vrms, emon.Irms, emon.apparentPower, kWh);

 lastmillis = millis();
 delay(5000); // Adjust the delay as needed
}
