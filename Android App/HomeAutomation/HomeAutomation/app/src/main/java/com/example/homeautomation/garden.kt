/**
 * @file 	garden.kt
 *
 * @author 	Thanuja Balabaskaran, Raksha Mairpady and Rutuja Muttha
 *
 * @brief   File for the garden fragment
 *
 ******************************************************************************/
package com.example.homeautomation

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import android.util.Log
import androidx.navigation.fragment.findNavController
import com.example.homeautomation.databinding.FragmentGardenBinding
import org.eclipse.paho.client.mqttv3.IMqttActionListener
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken
import org.eclipse.paho.client.mqttv3.IMqttToken
import org.eclipse.paho.client.mqttv3.MqttCallback
import org.eclipse.paho.client.mqttv3.MqttMessage

class garden : Fragment() {

    private val TAG = initialpage::class.java.simpleName
    private lateinit var mqttClient: MqttClient
    private lateinit var mqttClientId: String

    private lateinit var binding: FragmentGardenBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentGardenBinding.inflate(inflater,container,false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Click listeners to return to homepage
        binding.homepageButton.setOnClickListener {
            findNavController().navigate(R.id.action_garden_to_homepage)
        }

        // Click listeners to turn on light
        binding.lightOnButton.setOnClickListener {
            publishMessage(TURNON_MESSAGE, ESP_GD_LITEON_TOPIC, enableOnBtn = false, enableOffBtn = true)
            publishTopic(ESP_GD_LITEON_TOPIC)
        }

        // Click listeners to turn off light
        binding.lightOffButton.setOnClickListener {
            publishMessage(TURNOFF_MESSAGE, ESP_GD_LITEOFF_TOPIC, enableOnBtn = true, enableOffBtn = false)
            publishTopic(ESP_GD_LITEOFF_TOPIC)
        }

        // Click listeners to open door
        binding.doorOpenButton.setOnClickListener {
            publishMessage(ESP_GD_DOOROPEN, ESP_GD_DOOROPEN_TOPIC, enableOnBtn = false, enableOffBtn = true)
            publishTopic(ESP_GD_DOOROPEN_TOPIC)
        }

        // Click listeners to close door
        binding.doorCloseButton.setOnClickListener {
            publishMessage(ESP_GD_DOORCLOSE, ESP_GD_DOORCLOSE_TOPIC, enableOnBtn = true, enableOffBtn = false)
            publishTopic(ESP_GD_DOORCLOSE_TOPIC)
        }

        // Check if an Internet connection is available and exit if not
        if (!(activity as MainActivity).isConnected()) {
            Log.d(TAG, "Internet connection NOT available")
            Toast.makeText(context, "Internet connection NOT available", Toast.LENGTH_LONG)
                .show()
            (activity as MainActivity).finish()
        } else {
            Log.d(TAG, "Connected to the Internet")
            Toast.makeText(context, "Connected to the Internet", Toast.LENGTH_LONG).show()
        }

        // Create a new MQTT client and set the initial state of the buttons
        mqttClientId = org.eclipse.paho.client.mqttv3.MqttClient.generateClientId()
        mqttClient = MqttClient(requireContext(), MQTT_SERVER_URI, mqttClientId)

        //set initial set of Buttons
        binding.mqttConnect.isEnabled = true
        binding.mqttDisconnect.isEnabled = false
        binding.lightOnButton.isEnabled = false
        binding.lightOffButton.isEnabled = false
        binding.doorOpenButton.isEnabled = false
        binding.doorCloseButton.isEnabled = false

        // Set the click listeners for the connect and disconnect buttons
        binding.mqttConnect.setOnClickListener {
            //Connect to MQTT Broker and subscribe to the status topic
            mqttClient.connect(
                MQTT_USERNAME,
                MQTT_PWD,
                object : IMqttActionListener {
                    // Called when the connection is successful
                    override fun onSuccess(asyncActionToken: IMqttToken?) {
                        Log.d(TAG, "Connection success")
                        val successMsg = "MQTT Connection to $MQTT_SERVER_URI Established"
                        Toast.makeText(context, successMsg, Toast.LENGTH_LONG)
                            .show()
                        binding.mqttConnect.isEnabled = false
                        binding.mqttDisconnect.isEnabled = true

                        binding.lightOnButton.isEnabled = true
                        binding.lightOffButton.isEnabled = true

                        binding.doorOpenButton.isEnabled = true
                        binding.doorCloseButton.isEnabled = true

                        //subscribe to the status topic
                        subscribeToTopic(STS_TOPIC)
                        subscribeToTopic(ESP_GD_LITE_TOPIC)
                        subscribeToTopic(ESP_GD_DOOR_TOPIC)
                    }
                    // This function is called when the connection to the MQTT broker fails.
                    // It logs the exception and displays a toast message with the failure message.
                    override fun onFailure(
                        asyncActionToken: IMqttToken?,
                        exception: Throwable?
                    ) {
                        Log.d(TAG, "Connection failure ${exception.toString()}")
                        val failureMsg =
                            "MQTT Connection to $MQTT_SERVER_URI failed ${exception.toString()}"
                        Toast.makeText(context, failureMsg, Toast.LENGTH_LONG)
                            .show()
                        exception?.printStackTrace()
                    }
                },
                object : MqttCallback {
                    // This function is called when a message is received on a subscribed topic.
                    // It logs the message and updates the UI with the message payload.
                    override fun messageArrived(topic: String?, message: MqttMessage?) {
                        val msg =
                            "Received message: ${message.toString()} from topic: $topic"
                        Log.d(TAG, msg)
                    }
                    // This function is called when the connection to the MQTT broker is lost.
                    // It logs the cause of the loss.
                    override fun connectionLost(cause: Throwable?) {
                        Log.d(TAG, "Connection lost: ${cause.toString()}")
                    }
                    // This function is called when a message has been successfully delivered.
                    // It logs that the delivery is complete.
                    override fun deliveryComplete(token: IMqttDeliveryToken?) {
                        Log.d(TAG, "Delivery Complete")
                    }
                }
            )
        }

        // This function is called when the disconnect button is clicked.
        // It disconnects from the MQTT broker and disables the connect and disconnect buttons.
        binding.mqttDisconnect.setOnClickListener {
            //Disconnect from MQTT Broker if connected
            if (mqttClient.isConnected()) {
                mqttClient.disconnect(object : IMqttActionListener {
                    override fun onSuccess(asyncActionToken: IMqttToken?) {
                        Log.d(TAG, "Disconnected from $MQTT_SERVER_URI")
                        Toast.makeText(
                            context,
                            "MQTT Disconnection success",
                            Toast.LENGTH_LONG
                        ).show()
                        binding.mqttConnect.isEnabled = true
                        binding.mqttDisconnect.isEnabled = false

                        binding.lightOnButton.isEnabled = false
                        binding.lightOffButton.isEnabled = false

                        binding.doorOpenButton.isEnabled = false
                        binding.doorCloseButton.isEnabled = false
                    }
                    // This function is called when the disconnection from the MQTT broker fails.
                    // It logs the exception.
                    override fun onFailure(
                        asyncActionToken: IMqttToken?,
                        exception: Throwable?
                    ) {
                        Log.d(
                            TAG,
                            "Failed to disconnect exception: ${exception.toString()}"
                        )
                        Toast.makeText(context, "Failed to disconnect exception: ${exception.toString()}", Toast.LENGTH_SHORT).show()
                    }
                })
            } else {
                Log.d(TAG, "Impossible to disconnect, no server connected")
                Toast.makeText(context, "Impossible to disconnect, no server connected", Toast.LENGTH_SHORT).show()
            }
        }
    }

    // Function to publish the topic to MQTT
    private fun publishTopic(topic: String) {
        // Check if the MQTT client is connected or not.
        if (mqttClient.isConnected()) {
            // Create a new message.
            val message = ""
            // Publish the message to the specified topic.
            mqttClient.publish(
                topic,
                message,
                1,
                false,
                object : IMqttActionListener {
                    // When the message is successfully published.
                    override fun onSuccess(asyncActionToken: IMqttToken?) {
                        val msg = "Successfully published topic: $topic"
                        Log.d(TAG, msg)
                        Toast.makeText(context, msg, Toast.LENGTH_SHORT).show()
                    }
                    // When there is an error publishing the message.
                    override fun onFailure(
                        asyncActionToken: IMqttToken?,
                        exception: Throwable?
                    ) {
                        val msg =
                            "Failed to publish: to topic: $topic exception: ${exception.toString()}"
                        Log.d(TAG, msg)
                        Toast.makeText(context, msg, Toast.LENGTH_SHORT).show()
                    }
                })
        } else {
            Log.d(TAG, "Impossible to publish, no server connected")
            Toast.makeText(context, "Impossible to publish, no server connected", Toast.LENGTH_SHORT).show()
        }
    }

    // Function to publish the message to MQTT
    private fun publishMessage(
        message: String,
        selectedTopic: String,
        enableOnBtn: Boolean,
        enableOffBtn: Boolean
    ) {
        // Check if the MQTT client is connected or not.
        if (mqttClient.isConnected()) {
            // Specify the topic for the message.
            val topic = CONTROLLER_TOPIC
            // Publish the message to the specified topic.
            mqttClient.publish(
                topic,
                message,
                1,
                false,
                object : IMqttActionListener {
                    // When the message is successfully published.
                    override fun onSuccess(asyncActionToken: IMqttToken?) {
                        val msg = "Successfully published message: $message to topic: $topic"
                        Log.d(TAG, msg)
                        Toast.makeText(context, msg, Toast.LENGTH_SHORT).show()

                        if((selectedTopic == ESP_GD_LITEON_TOPIC) || (selectedTopic == ESP_GD_LITEOFF_TOPIC)){
                            binding.lightOnButton.isEnabled = enableOnBtn
                            binding.lightOffButton.isEnabled = enableOffBtn
                        }else if((selectedTopic == ESP_GD_DOOROPEN_TOPIC) || (selectedTopic == ESP_GD_DOORCLOSE_TOPIC)){
                            binding.doorOpenButton.isEnabled = enableOnBtn
                            binding.doorCloseButton.isEnabled = enableOffBtn
                        }
                        else
                        {
                            Log.d(TAG, "Unknown topic")
                            Toast.makeText(context, "Unknown topic", Toast.LENGTH_SHORT).show()
                        }
                    }
                    // When there is an error publishing the message.
                    override fun onFailure(
                        asyncActionToken: IMqttToken?,
                        exception: Throwable?
                    ) {
                        val msg =
                            "Failed to publish: $message to topic: $topic exception: ${exception.toString()}"
                        Log.d(TAG, msg)
                        Toast.makeText(context, msg, Toast.LENGTH_SHORT).show()
                    }
                }
            )
        }
        else {
            Log.d(TAG, "Impossible to publish, no server connected")
            Toast.makeText(context, "Impossible to publish, no server connected", Toast.LENGTH_SHORT).show()
        }
    }

    // Function to subscribe the topics from MQTT
    fun subscribeToTopic(subscribeTopic: String) {
        // subscribe to status topic only if connected to broker
        if (mqttClient.isConnected()) {  // Check if connected to the broker
            // Subscribe to the topic with QoS level 1
            mqttClient.subscribe(
                topic = subscribeTopic,
                qos = 1,
                // Implementation of the IMqttActionListener interface for success/failure callbacks
                object : IMqttActionListener {
                    // Called when the subscription is successful
                    override fun onSuccess(asyncActionToken: IMqttToken?) {
                        val msg = "Subscribe to: $subscribeTopic"
                        Log.d(TAG, msg)
                        Toast.makeText(context, msg, Toast.LENGTH_SHORT).show()
                        // Update the appropriate TextView objects based on the subscribed topic
                    }
                    // Called when the subscription fails
                    override fun onFailure(
                        asyncActionToken: IMqttToken?,
                        exception: Throwable?
                    ) {
                        Log.d(
                            TAG,
                            "Failed to subscribe: $STS_TOPIC exception: ${exception.toString()}"
                        )
                    }
                })
        } else {
            Log.d(TAG, "Cannot subscribe to: $STS_TOPIC: Not Connected to server")
        }
    }
}