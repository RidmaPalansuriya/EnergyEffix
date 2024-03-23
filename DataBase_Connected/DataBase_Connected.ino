//Include required libraries
#include "WiFi.h"
#include <HTTPClient.h>
#include <ZMPT101B.h>

String URL = "http://192.168.23.198/sdgp/database.php";

// WiFi credentials
const char* ssid = "[Evozi.com]";         // change SSID
const char* password = "sasindudh";    // change password
// Google script ID and required credentials
String GOOGLE_SCRIPT_ID = "AKfycbyBfGKguly_sZJvcmA6Xi9gEMgrYNCVJFreWoQ3SPfDUKYs2XuwwyeVF6XNwDB0xspA";    // change Gscript ID

#define SENSITIVITY 500.0f
// and the voltage source frequency is 50 Hz.
int vsensor=34;
const int ACPin = 33;         
ZMPT101B voltageSensor(vsensor, 50.0);

float correctionfactor=20;

float Current_Value = 0;

#define ACTectionRange 20;    //set Non-invasive AC Current Sensor tection range (5A,10A,20A)
#define VREF 3.3
char units[5];
unsigned long last_time =0;
unsigned long current_time =0;
float Wh =0 ;  
void setup() {
  Serial.begin(115200);
   pinMode(ACPin,INPUT);
   voltageSensor.setSensitivity(SENSITIVITY);
 
  // connect to WiFi
  Serial.println();
  Serial.print("Connecting to wifi: ");
  Serial.println(ssid);
  Serial.flush();
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

}
void loop() {
char units; 

 float ACcurrent=0;
float current_value = readACCurrentValue();
ACcurrent=current_value;

    delay(1000);

//Serial.print(ACcurrent);
  //Serial.println("Current: ");

  float acvoltage = voltageSensor.getRmsVoltage();
  Serial.println(acvoltage);

float P = acvoltage * ACcurrent;
  last_time = current_time;
  current_time = millis();    
  Wh = Wh+  P *(( current_time -last_time) /3600000.0) ; 
//   dtostrf(Wh, 4, 2, units);  
    String urlFinal = "https://script.google.com/macros/s/"+GOOGLE_SCRIPT_ID+"/exec?"+"voltage="+ String(acvoltage)+ "&current=" + String(ACcurrent)+ "&power=" + String(P)+ "&units=" + String(Wh);
    Serial.print("POST data to spreadsheet:");
    //Serial.println(urlFinal);
    String postData = "voltage="+ String(acvoltage)+ "&current=" + String(ACcurrent)+ "&power=" + String(P)+ "&units=" + String(Wh);
    Serial.println("POST data to database");
    HTTPClient http;
    http.begin(URL);
    http.begin(urlFinal.c_str());
    http.setFollowRedirects(HTTPC_STRICT_FOLLOW_REDIRECTS);
    int httpCode = http.GET(); 
    int httpCode1 = http.POST(postData);
    Serial.print("HTTP Status Code: ");
    //getting response from google sheet
    String payload = http.getString();

    Serial.print("URL : "); Serial.println(URL);
    Serial.print("Data : "); Serial.println(postData);
    Serial.print("httpCode: "); Serial.println(httpCode1);
    Serial.print("payload : "); Serial.println(payload);
    //---------------------------------------------------------------------
    http.end();
  delay(1000);
} 
float readACCurrentValue()
{
  float ACCurrentValue = 0;
  float peakVoltage = 0;
  float voltageVirtualValue = 0;  //Vrms
  for (int i = 0; i < 5; i++)
  {
    peakVoltage += analogRead(ACPin);   //read peak voltage
    Serial.println(ACPin);
    peakVoltage = peakVoltage + correctionfactor;
    delay(1);
  }
  peakVoltage = peakVoltage / 5;
  voltageVirtualValue = peakVoltage * 0.707;    //change the peak voltage to the Virtual Value of voltage

  //The circuit is amplified by 2 times, so it is divided by 2.
  voltageVirtualValue = (voltageVirtualValue / 4095 * VREF ) / 2;

  ACCurrentValue = voltageVirtualValue * ACTectionRange;

  return ACCurrentValue;
}