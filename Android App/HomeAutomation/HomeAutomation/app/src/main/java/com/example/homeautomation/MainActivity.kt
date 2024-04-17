/**
 * @file 	MainActivity.kt
 *
 * @author 	Thanuja Balabaskaran, Raksha Mairpady and Rutuja Muttha
 *
 * @brief   File for the main activity
 *
 ******************************************************************************/
package com.example.homeautomation

import android.content.Context
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import com.example.homeautomation.databinding.ActivityMainBinding
import org.eclipse.paho.client.mqttv3.*
import android.widget.Toast
import androidx.fragment.app.viewModels
import androidx.activity.viewModels
import com.example.homeautomation.databinding.FragmentBedroomBinding
import com.example.homeautomation.databinding.FragmentGarageBinding
import com.example.homeautomation.databinding.FragmentGardenBinding
import com.example.homeautomation.databinding.FragmentKitchenBinding
import com.example.homeautomation.databinding.FragmentLivingroomBinding

class MainActivity : AppCompatActivity() {

    // Helper function to check if the device is connected to the internet
     fun isConnected(): Boolean {
        // Initialize a variable called result and set its default value to false.
        var result = false
        // Create an instance of the ConnectivityManager class to manage the network connections.
        val cm = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        // Get the capabilities of the currently active network
        val capabilities = cm.getNetworkCapabilities(cm.activeNetwork)
        // Check if there is a network connection and if so, check if it is a wifi, cellular, or VPN connection
        if (capabilities != null) {
            result = when {
                capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) ||
                        capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) ||
                        capabilities.hasTransport(NetworkCapabilities.TRANSPORT_VPN) -> true
                // Otherwise, return false.
                else -> false
            }
        }
        return result
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}
