#include <Servo.h>

Servo ESC; 
Servo ESC1; 
Servo ESC2; 
Servo ESC3;
int Speed; 
#define CH3 3
#define CH1 2
 
// Integers to represent values from sticks and pots
int ch1Value;
int ch3Value;

 
// Boolean to represent switch value
 
// Read the number of a specified channel and convert to the range provided.
// If the channel is off, return the default value
int readChannel(int channelInput, int minLimit, int maxLimit, int defaultValue){
  int ch = pulseIn(channelInput, HIGH, 30000);
  if (ch < 100) return defaultValue;
  return map(ch, 1000, 2000, minLimit, maxLimit);
}
 
// Read the switch channel and return a boolean value
bool readSwitch(byte channelInput, bool defaultValue){
  int intDefaultValue = (defaultValue)? 100: 0;
  int ch = readChannel(channelInput, 0, 100, intDefaultValue);
  return (ch > 50);
}
 
void setup(){
ESC.attach(9,1000,2000);
ESC1.attach(10,1000,2000);
ESC2.attach(6,1000,2000);
ESC3.attach(5,1000,2000);
Serial.begin(115200);
  
  // Set all pins as inputs
  pinMode(CH3, INPUT);
  pinMode(CH1, INPUT);
}

void loop(){
ch1Value = readChannel(CH3, 0, 180, 0);
ch3Value = readChannel(CH3, 0, 100, 0);
Speed = map(ch1Value, 0, 155, 0, 180);
  //  Speed1 = map(ch1Value, 0, 1023, 0, 100);
   // Get values for each channel
 Serial.println(Speed);
 ESC.write(Speed);
 ESC1.write(Speed);
 ESC2.write(Speed);
 ESC3.write(Speed);
}
