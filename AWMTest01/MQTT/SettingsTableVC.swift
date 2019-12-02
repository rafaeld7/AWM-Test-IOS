//
//  SettingsTableVC.swift
//  AWMTest01
//
//  Created by AWM Solutions on 10/30/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit

class SettingsTableVC: UIViewController {
    
    @IBOutlet weak var hostField: UITextField!
    @IBOutlet weak var portField: UITextField!
    var isChanged = false

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        hostField.text = MqttSettings.shared.host
        portField.text = MqttSettings.shared.port
    }
    
    @IBAction func Guardar(_ sender: UIButton) {
        saveSettings()
    }
    // Replace with generic
    @objc func saveSettings() {
        
        if isChanged {
            let updateAlert = UIAlertController(title: "Actualizar la configuración", message: "¿Desea guardarlas y reiniciar la sesión?", preferredStyle: UIAlertController.Style.alert)
            
            updateAlert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (action: UIAlertAction!) in
                if let host = self.hostField.text, !host.isEmpty { MqttSettings.shared.host = host }
                if let port = self.portField.text, !port.isEmpty { MqttSettings.shared.port = port }
                MqttManager.shared.disconnect()
                self.navigationController?.popViewController(animated: true)
            }))
            
            updateAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            
            present(updateAlert, animated: true, completion: nil)
        }
        if !isChanged {
            let updateAlert = UIAlertController(title: "No ha modificado ningún campo", message: "Nos parece que ni siquiera tocaste los ajustes", preferredStyle: UIAlertController.Style.alert)
            updateAlert.addAction(UIAlertAction(title: "Seguro", style: .default, handler: nil))
            present(updateAlert, animated: true, completion: nil)
        }
    }
    @IBAction func changeTextField(_ sender: UITextField) {
        isChanged = true
    }

}
