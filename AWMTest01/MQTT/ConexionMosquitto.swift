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

    let mqttClient = CocoaMQTT(clientID: "sonoff01", host: "34.73.245.233", port: 1883)
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    //Boton de encendido y apagado del sonoff con mosquitto
    @IBAction func Sonoff(_ sender: UIButton) {
        mqttClient.connect()
       // mqttClient.publish("sonoff", withString: "stat/sonoff/POWER")
    }
    
    @IBAction func conexionMosquitto(_ sender: UIButton) {
        mqttClient.connect()
    }
    
}
