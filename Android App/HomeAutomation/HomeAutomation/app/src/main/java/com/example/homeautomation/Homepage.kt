package com.example.homeautomation

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.navigation.fragment.findNavController
import com.example.homeautomation.databinding.FragmentBedroomBinding
import com.example.homeautomation.databinding.FragmentGarageBinding
import com.example.homeautomation.databinding.FragmentGardenBinding
import com.example.homeautomation.databinding.FragmentHomepageBinding
import com.example.homeautomation.databinding.FragmentInitialpageBinding
import com.example.homeautomation.databinding.FragmentKitchenBinding
import com.example.homeautomation.databinding.FragmentLivingroomBinding
import org.eclipse.paho.client.mqttv3.IMqttActionListener
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken
import org.eclipse.paho.client.mqttv3.IMqttToken
import org.eclipse.paho.client.mqttv3.MqttCallback
import org.eclipse.paho.client.mqttv3.MqttMessage

class Homepage : Fragment() {

    private lateinit var binding: FragmentHomepageBinding
    private lateinit var ipbinding: FragmentInitialpageBinding
    private lateinit var lrbinding: FragmentLivingroomBinding
    private lateinit var brbinding: FragmentBedroomBinding
    private lateinit var krbinding: FragmentKitchenBinding
    private lateinit var grbinding: FragmentGarageBinding
    private lateinit var gdbinding: FragmentGardenBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentHomepageBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        ipbinding = FragmentInitialpageBinding.inflate(layoutInflater)
        lrbinding = FragmentLivingroomBinding.inflate(layoutInflater)
        brbinding = FragmentBedroomBinding.inflate(layoutInflater)
        krbinding = FragmentKitchenBinding.inflate(layoutInflater)
        grbinding = FragmentGarageBinding.inflate(layoutInflater)
        gdbinding = FragmentGardenBinding.inflate(layoutInflater)

        binding.lrButton.setOnClickListener {
            findNavController().navigate(R.id.action_homepage_to_livingroom)
        }
        binding.kButton.setOnClickListener {
            findNavController().navigate(R.id.action_homepage_to_kitchen)
        }
        binding.brButton.setOnClickListener {
            findNavController().navigate(R.id.action_homepage_to_bedroom)
        }
        binding.grButton.setOnClickListener {
            findNavController().navigate(R.id.action_homepage_to_garage)
        }
        binding.gdButton.setOnClickListener {
            findNavController().navigate(R.id.action_homepage_to_garden)
        }
        binding.initialpage.setOnClickListener {
            findNavController().navigate(R.id.action_homepage_to_initialpage)
        }
    }
}