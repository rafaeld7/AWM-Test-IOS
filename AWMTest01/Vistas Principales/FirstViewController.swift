//
//  FirstViewController.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/10/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit
import CocoaMQTT
import Firebase

class FirstViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sw: UISwitch!
    @IBOutlet weak var currentStateLabel: UILabel!

    var isConnected = false
    var receivedMessages: [(topic: String, message: String)] = []
    var currentTopic: String?
    var pickerData: [String] = [String]()
    var Switch : Bool?
    var refHandler: DatabaseHandle!
    var ref = DatabaseReference.init()
    var dispositivo : String = ""
    var dispositivos: [ Dispositivo ] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MqttManager.shared.delegate = self
        //Guardar Teclado
        hideKeyboard()
        //Base de Datos Firebase
        ref = Database.database().reference()
        //------Escribir Datos---//
        
        //-----leer Datos------//
        refHandler = ref.child("Usuario").child((Auth.auth().currentUser?.uid)!).child("Dispositivo").child("Switch").observe(.value, with: { (Snapshot) in
            print("Switch : \(Snapshot.value!) ")
            self.Switch = Snapshot.value! as? Bool
           
        //-----Estado Dispositivo-------//
            if self.Switch ?? true {
                self.sw.isOn = true
            }else{
                self.sw.isOn = false
            }
        })
        //-------------Table View------------//
         dispositivos = createArray()
         tableView.tableFooterView = UIView.init(frame: .zero)
   
//--------Estado del servidor (conectado/desconectado)------//
        if !isConnected{
            receivedMessages.removeAll()
            //tableView.reloadData()
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
 
    //Boton MQTT

    //  Inicio de MQTT CLEAN
    @IBAction func ONOFFSonoffmqtt() {
        MqttManager.shared.publish(message: "3", topic: "cmnd/sonoff-5700/power")
    }
    @IBAction func swSonoffMQTT(_ sender: UISwitch) {
       
        if sw.isOn {
            MqttManager.shared.publish(message: "1", topic: "cmnd/sonoff-4682/power")
            sw.isOn = true
            //BD Firebase
        self.ref.child("Usuario").child((Auth.auth().currentUser?.uid)!).child("Dispositivo").child("Switch").setValue(true)
        } else {
            MqttManager.shared.publish(message: "0", topic: "cmnd/sonoff-4682/power")
            sw.isOn = false
            //BD Firebase
        self.ref.child("Usuario").child((Auth.auth().currentUser?.uid)!).child("Dispositivo").child("Switch").setValue(false)
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
        }
        print(pickerData)
    }
   // Fin de MQTT
//----------------Table View-----------//
    
    func createArray() -> [Dispositivo] {

        var temDispositivo: [Dispositivo] = []
        let dispositivo1 = Dispositivo(idDispositivo: "sonoff-5700", funcion: "toggle", estado: false)
        let dispositivo2 = Dispositivo(idDispositivo: "sonoff-4682", funcion: "blink", estado: false)
        let dispositivo3 = Dispositivo(idDispositivo: "sonoff-xxxx", funcion: "toggle", estado: false)

          temDispositivo.append(dispositivo1)
          temDispositivo.append(dispositivo2)
          temDispositivo.append(dispositivo3)

        return temDispositivo
    }
    @IBAction func `switch`(_ sender: Any) {
         MqttManager.shared.publish(message: "2", topic: "cmnd/sonoff-4682/power")

   }
    
}

//----------Extencion Table View-------//
extension FirstViewController: UITableViewDataSource, UITabBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dispositivos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dispositivo = dispositivos[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.setDispositivo(Dispositivo: dispositivo)

        return cell

    }


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



