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
    
    //MQTT
   let mqttClient = CocoaMQTT(clientID: "sonoff-4682", host: "34.73.245.233", port: 1883)
   let mqttClient01 = CocoaMQTT(clientID: "sonoff-5700", host: "34.73.245.233", port: 1883)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//Boton
    @IBAction func onoffSonoffPorton(_ sender: Any) {
        sincrono(urls: "http://10.0.0.89/cm?cmnd=Power%20Blink")
    }
    //Boton Switch
    @IBAction func onoffsonoffNormal(_ sender: Any) {
    //cambiar URL
        let urls = "http://10.0.1.237/cm?cmnd=Power%20TOGGLE"
        //
        let url = NSURL(string: urls)
        let datos :NSData? = NSData(contentsOf: url! as URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
        myTextView.text = "\(String(describing: texto))"
    }
    
    //Funcion para la comunicacion via HTTP con la APP y Tasmota
    func sincrono(urls: String){
        let urls = "http://10.0.0.89/cm?cmnd=Power%20Blink"
        let url = NSURL(string: urls)
        let datos :NSData? = NSData(contentsOf: url! as URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
        myTextView.text = "\(String(describing: texto))"
    }
    
    //Boton MQTT
    
    @IBAction func sonoff(_ sender: UIButton) {
         mqttClient01.connect()
       // print(mqttClient)
       myTextView01.text = "\(String(mqttClient01.clientID))"
    }
    
    @IBAction func swSonoffMQTT(_ sender: UISwitch) {
        mqttClient.connect()
      //  myTextView01.text = "\(String(mqttClient.debugDescription))"
      //  myTextView01.text = "\(String(mqttClient.clientID))"
        myTextView01.text = "\(Bool(mqttClient.connect()))"

    }
    
    func mqtttest(){
        let mqttClientTest = CocoaMQTT(clientID: "sonoff-4682", host: "34.73.245.233", port: 1883)
        mqttClientTest.connect()
        
    }
    
    
    
}

