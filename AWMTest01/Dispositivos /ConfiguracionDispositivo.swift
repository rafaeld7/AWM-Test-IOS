//
//  ConfiguracionDispositivo.swift
//  AWMTest01
//
//  Created by AWM Solutions on 11/1/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit

class ConfiguracionDispositivo: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var mensaje: UITextField!
    @IBOutlet weak var topic: UITextField!
    @IBOutlet weak var currentStateLabel: UILabel!
    var isConnected = false
    var receivedMessages: [(topic: String, message: String)] = []
    var currentTopic: String?
    var pickerData: [String] = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        MqttManager.shared.delegate = self
        hideKeyboard()
        
        //connect data :
        self.picker.delegate = self
        self.picker.dataSource = self
        
        //input the data into the array
        pickerData = ["Toggle", "blink"]
        
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
    }

     // Funciones del picker
    //Numeros de columna
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Nuemro de filas
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    //Los datos a devolver para la fila y el componente (columna) que se está pasando
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData [row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        <#code#>
    }
    
    
    //fin del picker
    
    
    @IBAction func Enviar(_ sender: Any) {
        MqttManager.shared.subscribe(topic: topic.text!)
        
        var currentTopic = topic.text
    
        
        if let topic = currentTopic {
            MqttManager.shared.publish(message: mensaje.text!, topic: topic)
        } else {
            print("Topic is not selected")
        }
    }
    
    
    
    
    //final de la clase
}
    
    // MARK: - MqttManagerDelegate
extension ConfiguracionDispositivo: MqttManagerDelegate {
        func onMqttConnected() {
            isConnected = true
            currentStateLabel.text = "Conectado"
            currentStateLabel.textColor = UIColor(hex: 0x4996FA)
            //setupButtonStyle(button: subscribeButton, alpha:1, isEnabled: true)
           // setupButtonStyle(button: connectButton, alpha: 0.5, isEnabled: false)
           // setupButtonStyle(button: disconnectButton, alpha: 1, isEnabled: true)
          // editingMessage(true)
        }
        
        func onMqttDisconnected() {
            isConnected = false
            currentStateLabel.text = "Desconectado"
            currentStateLabel.textColor = UIColor(hex: 0xC1001D)
//            setupButtonStyle(button: subscribeButton, alpha: 0.5, isEnabled: false)
//            setupButtonStyle(button: connectButton, alpha: 1, isEnabled: true)
//            setupButtonStyle(button: disconnectButton, alpha: 0.5, isEnabled: false)
//            currentTopic = nil
//            messageTextField.text = ""
//            countSubscriptions.text = "My subsciptions (0)"
//            editingMessage(true)
        }
        
        @objc func onMqttMessageReceived(message: String, topic: String) {
          //  receivedMessages.append((topic: topic, message: message))
           // self.tableView.reloadData()
        }
        
        func onMqttError(message: String) { }
    }


