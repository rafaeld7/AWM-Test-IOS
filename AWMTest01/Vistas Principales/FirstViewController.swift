//
//  FirstViewController.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/10/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit
import CocoaMQTT

class FirstViewController: UIViewController {

    
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myTextView01: UITextView!
    @IBOutlet weak var sw: UISwitch!
    @IBOutlet weak var currentStateLabel: UILabel!
    
    

    var isConnected = false
    var receivedMessages: [(topic: String, message: String)] = []
    var currentTopic: String?
    var pickerData: [String] = [String]()

    
    //MQTT
//  let mqttClient = CocoaMQTT(clientID: "sonoff-4682", host: "34.73.245.233", port: 1883)
//  let mqttClient01 = CocoaMQTT(clientID: "sonoff-5700", host: "34.73.245.233", port: 1883)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MqttManager.shared.delegate = self
        //Guardar Teclado
        hideKeyboard()
        //Estado del servidor (conectado/desconectado)
        if !isConnected{
            receivedMessages.removeAll()
            MqttManager.shared.connect(host: MqttSettings.shared.host,
                                       port: Int(MqttSettings.shared.port)!,
                                       username: MqttSettings.shared.username,
                                       password: MqttSettings.shared.password,
                                       cleanSession: MqttSettings.shared.cleanSession)
        }
        else{
            MqttManager.shared.disconnect()
        }
        print(pickerData)

    }//Boton
    @IBAction func onoffSonoffPorton(_ sender: Any) {
        sincrono(urls: "http://10.0.0.89/cm?cmnd=Power%20Blink")
    }
    //Boton Switch
    @IBAction func onoffsonoffNormal(_ sender: Any) {
    //cambiar URL
        let urls = "http://10.0.1.237/cm?cmnd=Power%20TOGGLE"
        let url = NSURL(string: urls)
        let datos :NSData? = NSData(contentsOf: url! as URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
       // myTextView.text = "\(String(describing: texto))"
    }
    
    //Funcion para la comunicacion via HTTP con la APP y Tasmota
    func sincrono(urls: String){
        let urls = "http://10.0.0.89/cm?cmnd=Power%20Blink"
        let url = NSURL(string: urls)
        let datos :NSData? = NSData(contentsOf: url! as URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
        //myTextView.text = "\(String(describing: texto))"
    }

    //Boton MQTT

    //  Inicio de MQTT CLEAN
    @IBAction func ONOFFSonoffmqtt() {
        MqttManager.shared.publish(message: "3", topic: "cmnd/sonoff-5700/power")

    }


    @IBAction func swSonoffMQTT(_ sender: UISwitch) {
        if sw.isOn {
            MqttManager.shared.publish(message: "1", topic: "cmnd/sonoff-4682/power")
            sw.isOn = true
            myTextView01.text = MqttManager.shared.isConnected().description
        } else {
            MqttManager.shared.publish(message: "0", topic: "cmnd/sonoff-4682/power")
            sw.isOn = false
        }
    }

    @IBAction func refrescarEstadoServidor(_ sender: Any) {
         MqttManager.shared.delegate = self
        if !isConnected{
            receivedMessages.removeAll()
            MqttManager.shared.connect(host: MqttSettings.shared.host,
                                       port: Int(MqttSettings.shared.port)!,
                                       username: MqttSettings.shared.username,
                                       password: MqttSettings.shared.password,
                                       cleanSession: MqttSettings.shared.cleanSession)
        }
        else{
          //  MqttManager.shared.disconnect()
        }
        print(pickerData)
    }
    
    
    
   // Fin de MQTT
}

// MARK: - MqttManagerDelegate
extension FirstViewController: MqttManagerDelegate {
    func onMqttConnected() {
        isConnected = true
        currentStateLabel.text = "Conectado"
        currentStateLabel.textColor = UIColor(hex: 0x4996FA)
    }

    func onMqttDisconnected() {
        isConnected = false
        currentStateLabel.text = "Desconectado"
        currentStateLabel.textColor = UIColor(hex: 0xC1001D)
    }

    @objc func onMqttMessageReceived(message: String, topic: String) {
    }

    func onMqttError(message: String) { }
}


