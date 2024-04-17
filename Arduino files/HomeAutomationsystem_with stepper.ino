#include <Arduino.h>
#include <WiFi.h>
#include <AsyncMqttClient.h>
#include <AsyncTCP.h>
#define LED_BUILTIN 5
#define LED_BUILTIN2 17
#define LED_BUILTIN3 19
#define LED_BUILTIN4 18
#define LED_BUILTIN5 23
#define LED_BUILTIN6 15

#define StepperOne 32
#define StepperTwo 33
#define StepperThree 25
#define StepperFour 26
#define StepperFive 27
#define StepperSix 14
#define StepperSeven 12
#define StepperEight 13
#define StepperNine 4
#define StepperTen  2

#define buzzerPin 16
#define mq2Pin 34

const char *SSID = "S21FE";
const char *PWD = "Raksha1234";

// Threshold value for gas detection
const int gasThreshold = 1200;

// Duration in milliseconds the stepper stays HIGH
const unsigned long highDuration = 3000;

//FUNCTION TO CHECK WIFI CONNECTION
void connectToWiFi() {
  Serial.print("Connecting to ");
  Serial.println(SSID);
  
  WiFi.begin(SSID, PWD);
  
  while (WiFi.status() != WL_CONNECTED) {
  delay(500);
  Serial.print(".");
  }
  
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

AsyncMqttClient mqttClient;
char *mqttServer = "mqtt.eclipseprojects.io";
int mqttPort = 1883;

void callback(char* topic, char* payload, AsyncMqttClientMessageProperties properties, size_t len, size_t index, size_t total) {
  if (strcmp(topic, "/homeAutomation/lrLite") == 0) {
    // handle the existing LED topic as before
  }
  else if (strcmp(topic, "/homeAutomation/lrLiteOn") == 0) {
    Serial.println("The Command to turn ON the Led is Received");
    Serial.println("LED ON");
    digitalWrite(LED_BUILTIN, LOW); // turn LED on
  }
  else if (strcmp(topic, "/homeAutomation/lrLiteOff") == 0) {
    Serial.println("The Command to turn OFF the Led is Received");
    Serial.println("LED OFF");
    digitalWrite(LED_BUILTIN, HIGH); // turn LED off
  }
  else if (strcmp(topic, "/homeAutomation/brLiteOn") == 0) {
    Serial.println("The Command to turn ON the Led is Received");
    Serial.println("LED ON");
    digitalWrite(LED_BUILTIN2, LOW); // turn LED on
  }
  else if (strcmp(topic, "/homeAutomation/brLiteOff") == 0) {
    Serial.println("The Command to turn OFF the Led is Received");
    Serial.println("LED OFF");
    digitalWrite(LED_BUILTIN2, HIGH); // turn LED off
  }
  else if (strcmp(topic, "/homeAutomation/lrFanOn") == 0) {
    Serial.println("The Command to turn ON the fan is Received");
    Serial.println("Fan ON");
    digitalWrite(LED_BUILTIN3, HIGH); // turn LED on
  }
  else if (strcmp(topic, "/homeAutomation/lrFanOff") == 0) {
    Serial.println("The Command to turn OFF the fan is Received");
    Serial.println("Fan OFF");
    digitalWrite(LED_BUILTIN3, LOW); // turn fan off
  }
  else if (strcmp(topic, "/homeAutomation/krLiteOn") == 0) {
    Serial.println("The Command to turn ON the Led is Received");
    Serial.println("LED ON");
    digitalWrite(LED_BUILTIN4, LOW); // turn LED on
  }
  else if (strcmp(topic, "/homeAutomation/krLiteOff") == 0) {
    Serial.println("The Command to turn OFF the Led is Received");
    Serial.println("LED OFF");
    digitalWrite(LED_BUILTIN4, HIGH); // turn LED off
  }
  else if (strcmp(topic, "/homeAutomation/grLiteOn") == 0) {
    Serial.println("The Command to turn ON the Led is Received");
    Serial.println("LED ON");
    digitalWrite(LED_BUILTIN5, LOW); // turn LED on
  }
  else if (strcmp(topic, "/homeAutomation/grLiteOff") == 0) {
    Serial.println("The Command to turn OFF the Led is Received");
    Serial.println("LED OFF");
    digitalWrite(LED_BUILTIN5, HIGH); // turn LED off
  }
  else if (strcmp(topic, "/homeAutomation/gdLiteOn") == 0) {
    Serial.println("The Command to turn ON the Led is Received");
    Serial.println("LED ON");
    digitalWrite(LED_BUILTIN6, LOW); // turn LED on
  }
  else if (strcmp(topic, "/homeAutomation/gdLiteOff") == 0) {
    Serial.println("The Command to turn OFF the Led is Received");
    Serial.println("LED OFF");
    digitalWrite(LED_BUILTIN6, HIGH); // turn LED off
  }
  else if (strcmp(topic, "/homeAutomation/temperature") == 0) {
    // convert the payload to a string
    String temp_str = String(payload);
    
    Serial.println("Recieved temperature is: " + temp_str);
    // perform temperature handling here
    
    float temp = temp_str.toFloat();
    Serial.println(temp);
  }
  else if (strcmp(topic, "/homeAutomation/smoke") == 0) {
    // convert the payload to a string
    String smoke_strng = String(payload);
    
    Serial.println(smoke_strng);
  }
  else if (strcmp(topic, "/homeAutomation/krDoorOpen") == 0) {
    digitalWrite(StepperOne, HIGH); // Set StepperOne HIGH
    Serial.println("StepperOne set to HIGH.");
    delay(highDuration); // Keep HIGH for the duration
    digitalWrite(StepperOne, LOW); // Then set LOW
    Serial.println("StepperOne set to LOW.");
  }
  else if (strcmp(topic, "/homeAutomation/krDoorClose") == 0) {
    digitalWrite(StepperTwo, HIGH); // Set StepperTwo HIGH
    Serial.println("StepperTwo set to HIGH.");
    delay(highDuration); // Keep HIGH for the duration
    digitalWrite(StepperTwo, LOW); // Then set LOW
    Serial.println("StepperTwo set to LOW.");
  }
  else if (strcmp(topic, "/homeAutomation/brDoorOpen") == 0) {
    digitalWrite(StepperThree, HIGH); // Set StepperThree HIGH
    Serial.println("StepperThree set to HIGH.");
    delay(highDuration); // Keep HIGH for the duration
    digitalWrite(StepperThree, LOW); // Then set LOW
    Serial.println("StepperThree set to LOW.");
  }
  else if (strcmp(topic, "/homeAutomation/brDoorClose") == 0) {
    digitalWrite(StepperFour, HIGH); // Set StepperFour HIGH
    Serial.println("StepperFour set to HIGH.");
    delay(highDuration); // Keep HIGH for the duration
    digitalWrite(StepperFour, LOW); // Then set LOW
    Serial.println("StepperFour set to LOW.");
  }
  else if (strcmp(topic, "/homeAutomation/brCurtainOpen") == 0) {
    digitalWrite(StepperFive, HIGH);
    Serial.println("StepperFive set to HIGH");
    delay(highDuration);
    digitalWrite(StepperFive, LOW);
    Serial.println("StepperFive set to LOW");
  }
  else if (strcmp(topic, "/homeAutomation/brCurtainClose") == 0) {
    digitalWrite(StepperSix, HIGH);
    Serial.println("StepperSix set to HIGH");
    delay(highDuration);
    digitalWrite(StepperSix, LOW);
    Serial.println("StepperSix set to LOW");
  }
  else if (strcmp(topic, "/homeAutomation/grDoorOpen") == 0) {
    digitalWrite(StepperSeven, HIGH);
    Serial.println("StepperSeven set to HIGH");
    delay(highDuration);
    digitalWrite(StepperSeven, LOW);
    Serial.println("StepperSeven set to LOW");
  }
  else if (strcmp(topic, "/homeAutomation/grDoorClose") == 0) {
    digitalWrite(StepperEight, HIGH);
    Serial.println("StepperEight is set to HIGH");
    delay(highDuration);
    digitalWrite(StepperEight, LOW);
    Serial.println("StepperEight is set to LOW");
  }
  else if (strcmp(topic, "/homeAutomation/gdDoorOpen") == 0) {
    digitalWrite(StepperNine, HIGH);
    Serial.println("StepperNine is set to HIGH");
    delay(highDuration);
    digitalWrite(StepperNine, LOW);
    Serial.println("StepperNine is set to LOW");
  }
  else if (strcmp(topic, "/homeAutomation/gdDoorClose") == 0) {
    digitalWrite(StepperTen, HIGH);
    Serial.println("StepperTen is set to HIGH");
    delay(highDuration);
    digitalWrite(StepperTen, LOW);
    Serial.println("StepperTen is set to LOW");
  }
}

void setupMQTT() {
  mqttClient.onMessage([](char* topic, char* payload, AsyncMqttClientMessageProperties properties, size_t len, size_t index, size_t total) {
  callback(topic, payload, properties, len, index, total);
  });
  
  // Subscribe to the /raksmair/led topic with QoS 1
  mqttClient.subscribe("/homeAutomation/lrLiteOn", 1);
  mqttClient.subscribe("/homeAutomation/lrLiteOff", 1);
  mqttClient.subscribe("/homeAutomation/brLiteOn", 1);
  mqttClient.subscribe("/homeAutomation/brLiteOff", 1);
  mqttClient.subscribe("/homeAutomation/lrFanOn", 1);
  mqttClient.subscribe("/homeAutomation/lrFanOff", 1);
  mqttClient.subscribe("/homeAutomation/krLiteOn", 1);
  mqttClient.subscribe("/homeAutomation/krLiteOff", 1);
  mqttClient.subscribe("/homeAutomation/grLiteOn", 1);
  mqttClient.subscribe("/homeAutomation/grLiteOff", 1);
  mqttClient.subscribe("/homeAutomation/gdLiteOn", 1);
  mqttClient.subscribe("/homeAutomation/gdLiteOff", 1);
  mqttClient.subscribe("/homeAutomation/temperature", 1);
  mqttClient.subscribe("/homeAutomation/smoke", 1);
  mqttClient.subscribe("/homeAutomation/krDoorOpen", 1);
  mqttClient.subscribe("/homeAutomation/krDoorClose", 1);
  mqttClient.subscribe("/homeAutomation/brDoorOpen", 1);
  mqttClient.subscribe("/homeAutomation/brDoorClose", 1);
  mqttClient.subscribe("/homeAutomation/gdDoorOpen", 1);
  mqttClient.subscribe("/homeAutomation/gdDoorClose", 1);
  mqttClient.subscribe("/homeAutomation/grDoorOpen", 1);
  mqttClient.subscribe("/homeAutomation/grDoorClose", 1);
  mqttClient.subscribe("/homeAutomation/brCurtainOpen", 1);
  mqttClient.subscribe("/homeAutomation/brCurtainClose", 1);
}

long last_time = 0;
char data[10];

void setup() {
  Serial.begin(9600);
  connectToWiFi();
  
  setupMQTT();
  mqttClient.setServer(mqttServer, mqttPort);
  mqttClient.connect();
  pinMode(LED_BUILTIN,OUTPUT);
  pinMode(LED_BUILTIN2,OUTPUT);
  pinMode(LED_BUILTIN3,OUTPUT);
  pinMode(LED_BUILTIN4,OUTPUT);
  pinMode(LED_BUILTIN5,OUTPUT);
  pinMode(LED_BUILTIN6,OUTPUT);
  pinMode(buzzerPin, OUTPUT);   // Set the buzzer pin as an output
  pinMode(mq2Pin, INPUT);
  pinMode(StepperOne, OUTPUT);
  pinMode(StepperTwo, OUTPUT);
  pinMode(StepperThree, OUTPUT);
  pinMode(StepperFour, OUTPUT);
  pinMode(StepperFive, OUTPUT);
  pinMode(StepperSix, OUTPUT);
  pinMode(StepperSeven, OUTPUT);
  pinMode(StepperEight, OUTPUT);
  pinMode(StepperNine, OUTPUT);
  pinMode(StepperTen, OUTPUT);
}

void loop() {
  int sensorValue = analogRead(mq2Pin); 
  long now = millis();
  
  if (!mqttClient.connected()) {
    // If MQTT client is disconnected, reset LED state to off
    digitalWrite(LED_BUILTIN, HIGH); // lrlight
    digitalWrite(LED_BUILTIN2, HIGH); // brlight
    digitalWrite(LED_BUILTIN3, LOW); // lrfan
    digitalWrite(LED_BUILTIN4, HIGH); // krlight
    digitalWrite(LED_BUILTIN5, HIGH); // gr light
    digitalWrite(LED_BUILTIN6, HIGH); // gd light
    digitalWrite(buzzerPin, LOW);
    digitalWrite(mq2Pin, LOW);
    digitalWrite(StepperOne, LOW);
    digitalWrite(StepperTwo, LOW);
    digitalWrite(StepperThree, LOW);
    digitalWrite(StepperFour, LOW);
    digitalWrite(StepperFive, LOW);
    digitalWrite(StepperSix, LOW);
    digitalWrite(StepperSeven, LOW);
    digitalWrite(StepperEight, LOW);
    digitalWrite(StepperNine, LOW);
    digitalWrite(StepperTen, LOW);
   
    Serial.println("MQTT client disconnected, resetting LED state");
  }
  
  if (mqttClient.connected()) {
  Serial.print("Sensor reading: ");
  Serial.println(sensorValue);         // Print the value to the Serial Monitor

  if (sensorValue > gasThreshold) {
    // If the sensor reading is above the threshold, turn the buzzer on
    digitalWrite(buzzerPin, HIGH);
    mqttClient.publish("/homeAutomation/smoke", 0, false, "Detected");
    Serial.println("Gas detected! Buzzer ON");
  } else {
    // If the sensor reading is below the threshold, turn the buzzer off
    mqttClient.publish("/homeAutomation/smoke", 0, false, "Not detected");
    digitalWrite(buzzerPin, LOW);
    }
  }

  if (now - last_time > 6000) {
    if (mqttClient.connected()) {
      mqttClient.subscribe("/homeAutomation/lrLiteOn", 1);
      mqttClient.subscribe("/homeAutomation/lrLiteOff", 1);
      
      mqttClient.subscribe("/homeAutomation/brLiteOn", 1);
      mqttClient.subscribe("/homeAutomation/brLiteOff", 1);
      
      mqttClient.subscribe("/homeAutomation/lrFanOn", 1);
      mqttClient.subscribe("/homeAutomation/lrFanOff", 1);
      
      mqttClient.subscribe("/homeAutomation/krLiteOn", 1);
      mqttClient.subscribe("/homeAutomation/krLiteOff", 1);
      
      mqttClient.subscribe("/homeAutomation/grLiteOn", 1);
      mqttClient.subscribe("/homeAutomation/grLiteOff", 1);
      
      mqttClient.subscribe("/homeAutomation/gdLiteOn", 1);
      mqttClient.subscribe("/homeAutomation/gdLiteOff", 1);
      
      mqttClient.subscribe("/homeAutomation/temperature", 1);
      
      mqttClient.subscribe("/homeAutomation/smoke", 1);
      
      mqttClient.subscribe("/homeAutomation/krDoorOpen", 1);
      mqttClient.subscribe("/homeAutomation/krDoorClose", 1);
      
      mqttClient.subscribe("/homeAutomation/brDoorOpen", 1);
      mqttClient.subscribe("/homeAutomation/brDoorClose", 1);
      
      mqttClient.subscribe("/homeAutomation/gdDoorOpen", 1);
      mqttClient.subscribe("/homeAutomation/gdDoorClose", 1);
      
      mqttClient.subscribe("/homeAutomation/grDoorOpen", 1);
      mqttClient.subscribe("/homeAutomation/grDoorClose", 1);
      
      mqttClient.subscribe("/homeAutomation/brCurtainOpen", 1);
      mqttClient.subscribe("/homeAutomation/brCurtainClose", 1);
  
      last_time = now;
    }
  }

     delay(100);
}
