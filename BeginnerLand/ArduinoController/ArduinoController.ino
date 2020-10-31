/*
 * A basic Arduino sketch to send Potentiometer data (0-255) to Serial for further use in processing.
 */

int potentiometer= A0; //Thats where the potentiometer is connected

void setup() {
  pinMode(potentiometer, INPUT);             // Set pin A0 as an input
  Serial.begin(9600);                    // Start serial communication at 9600 bps
}

void loop() {
  Serial.write(map(analogRead(potentiometer), 0 , 1023, 0, 255)); //Convert the 0-1024 range to 0-255 and the write to Serial
  delay(50);      
}
