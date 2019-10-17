//
//  ConexionMosquitto.swift
//  AWMTest01
//
//  Created by AWM Solutions on 10/15/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit
import CocoaMQTT

class ConexionMosquitto: UIViewController {

  //  let clientID = "sonoff01" + String(ProcessInfo().processIdentifier)
    let mqttClient = CocoaMQTT(clientID: "sonoff-4682", host: "34.73.245.233", port: 1883)
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MQTT
//        mqttClient.username = "admin"
//        mqttClient.password = "admin"
//        mqttClient.willMessage = CocoaMQTTWill(topic: "sonoff", message: "stat/sonoff/POWER")
//        mqttClient.keepAlive = 60
//        mqttClient.connect()
//        mqttClient.didReceiveMessage = { mqtt, message, id in
//            print("Message received in topic \(message.topic) with payload \(message.string!)")
//        }
    }
    //Boton de encendido y apagado del sonoff con mosquitto
    @IBAction func Sonoff(_ sender: UIButton) {
        
       
        
    }
    
    @IBAction func conexionMosquitto(_ sender: UIButton) {
        mqttClient.connect()
        mqttClient.didReceiveMessage = { mqtt, message, id in
            print("Message received in topic \(message.topic) with payload \(message.string!)")
        }
    }
    
}
