#define BLYNK_TEMPLATE_ID           "TMPL4YfcGJ5tH"
#define BLYNK_TEMPLATE_NAME         "LEDTEST"
#define BLYNK_AUTH_TOKEN            "dHMzciEDFsYlqbQ63fQpR-pmPFhQOYz4"

#define BLYNK_PRINT Serial


#include <ESP8266_Lib.h>
#include <BlynkSimpleShieldEsp8266.h>


char ssid[] = "NETIASPOT-2.4GHz-8Ps7";
char pass[] = "tw6eUEH8";
int LED1 = 7;
int LED2 = 8;

#include <SoftwareSerial.h>
SoftwareSerial EspSerial(2, 3); 


#define ESP8266_BAUD 9600

ESP8266 wifi(&EspSerial);

void setup()
{

  Serial.begin(115200);

  EspSerial.begin(ESP8266_BAUD);
  delay(10);

  Blynk.begin(BLYNK_AUTH_TOKEN, wifi, ssid, pass);

  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  Blynk.virtualWrite(V0,0);
  Blynk.virtualWrite(V1,0);
}

void loop()
{
  Blynk.run();

}

BLYNK_WRITE(V0) 
{
  if(param.asInt() == 1)
  {
    digitalWrite(LED1,HIGH); 
    Serial.println("LED1 ON");
  }
   else if(param.asInt()==0)
  {
    
    digitalWrite(LED1,LOW); 
      Serial.println("LED1 OFF");
  }
}

BLYNK_WRITE(V1)
{
  if(param.asInt() == 1)
  {

    digitalWrite(LED2,HIGH); 
      Serial.println("LED2 ON");
  }
  else if(param.asInt()==0)
  {
    
    digitalWrite(LED2,LOW);   
      Serial.println("LED2 OFF");
  }
}