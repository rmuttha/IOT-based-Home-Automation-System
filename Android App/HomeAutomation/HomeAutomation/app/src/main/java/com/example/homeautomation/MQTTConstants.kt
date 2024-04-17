/**
 * @file 	MQTTConstants.kt
 *
 * @author 	Thanuja Balabaskaran, Raksha Mairpady and Rutuja Muttha
 *
 * @brief   File for the MQTT related credentials, topics and messages
 *
 ******************************************************************************/
package com.example.homeautomation

// MQTT credentials and server
const val MQTT_SERVER_URI ="tcp://mqtt.eclipseprojects.io"
const val MQTT_USERNAME =""
const val MQTT_PWD= ""

//Topics for ESP 32
const val CONTROLLER_TOPIC = "homeautomation/ESP32"
const val STS_TOPIC = "homeautomation/Android/status"

// Topics for features
const val ESP_TEMP_TOPIC ="/homeAutomation/temperature"
const val ESP_SMOKE_TOPIC ="/homeAutomation/smoke"

const val ESP_LR_LITE_TOPIC = "/homeAutomation/lrLite"
const val ESP_KR_LITE_TOPIC = "/homeAutomation/krLite"
const val ESP_BR_LITE_TOPIC = "/homeAutomation/brLite"
const val ESP_GR_LITE_TOPIC = "/homeAutomation/grLite"
const val ESP_GD_LITE_TOPIC = "/homeAutomation/gdLite"

const val ESP_LR_FAN_TOPIC = "/homeAutomation/lrFan"

const val ESP_BR_CURTAIN_TOPIC = "/homeAutomation/brCurtain"

const val ESP_KR_DOOR_TOPIC = "/homeAutomation/krDoor"
const val ESP_BR_DOOR_TOPIC = "/homeAutomation/brDoor"
const val ESP_GR_DOOR_TOPIC = "/homeAutomation/grDoor"
const val ESP_GD_DOOR_TOPIC = "/homeAutomation/gdDoor"

// Messages for the topics
const val SMOKE_DETECTED_MESSAGE ="Detected"

const val TURNON_MESSAGE ="on"
const val TURNOFF_MESSAGE ="off"

const val ESP_KR_DOOROPEN ="1"
const val ESP_KR_DOORCLOSE ="2"

const val ESP_BR_DOOROPEN ="3"
const val ESP_BR_DOORCLOSE ="4"

const val ESP_BR_CURTAINOPEN ="5"
const val ESP_BR_CURTAINCLOSE ="6"

const val ESP_GR_DOOROPEN ="7"
const val ESP_GR_DOORCLOSE ="8"

const val ESP_GD_DOOROPEN ="9"
const val ESP_GD_DOORCLOSE ="10"

// Light on/off commands for each room
const val ESP_LR_LITEON_TOPIC = "/homeAutomation/lrLiteOn"
const val ESP_LR_LITEOFF_TOPIC = "/homeAutomation/lrLiteOff"

const val ESP_BR_LITEON_TOPIC = "/homeAutomation/brLiteOn"
const val ESP_BR_LITEOFF_TOPIC = "/homeAutomation/brLiteOff"

const val ESP_GR_LITEON_TOPIC = "/homeAutomation/grLiteOn"
const val ESP_GR_LITEOFF_TOPIC = "/homeAutomation/grLiteOff"

const val ESP_GD_LITEON_TOPIC = "/homeAutomation/gdLiteOn"
const val ESP_GD_LITEOFF_TOPIC = "/homeAutomation/gdLiteOff"

const val ESP_KR_LITEON_TOPIC = "/homeAutomation/krLiteOn"
const val ESP_KR_LITEOFF_TOPIC = "/homeAutomation/krLiteOff"

// Door open/close commands for each room
const val ESP_KR_DOOROPEN_TOPIC = "/homeAutomation/krDoorOpen"
const val ESP_KR_DOORCLOSE_TOPIC = "/homeAutomation/krDoorClose"

const val ESP_BR_DOOROPEN_TOPIC = "/homeAutomation/brDoorOpen"
const val ESP_BR_DOORCLOSE_TOPIC = "/homeAutomation/brDoorClose"

const val ESP_GD_DOOROPEN_TOPIC = "/homeAutomation/gdDoorOpen"
const val ESP_GD_DOORCLOSE_TOPIC = "/homeAutomation/gdDoorClose"

const val ESP_GR_DOOROPEN_TOPIC = "/homeAutomation/grDoorOpen"
const val ESP_GR_DOORCLOSE_TOPIC = "/homeAutomation/grDoorClose"

// Fan on/off command for living room
const val ESP_LR_FANON_TOPIC = "/homeAutomation/lrFanOn"
const val ESP_LR_FANOFF_TOPIC = "/homeAutomation/lrFanOff"

// Curtain open/close command for kitchen
const val ESP_BR_CURTAINOPEN_TOPIC = "/homeAutomation/brCurtainOpen"
const val ESP_BR_CURTAINCLOSE_TOPIC = "/homeAutomation/brCurtainClose"

