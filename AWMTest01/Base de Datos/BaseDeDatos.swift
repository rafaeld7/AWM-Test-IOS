//
//  BaseDeDatos.swift
//  AWMTest01
//
//  Created by AWM Solutions on 10/2/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit
import Firebase

class BaseDeDatos: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textNombreDispositivo: UITextField!
    @IBOutlet weak var textTema: UITextField!
    @IBOutlet weak var IPServidorMQTT: UITextField!
    @IBOutlet weak var textUsuario: UITextField!
    @IBOutlet weak var textContrasena: UITextField!
    
    var ref = DatabaseReference.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        textUsuario.delegate = self
       
    }//funcion para cerrar teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //fin cerra teclado
    
    
    func saveFIRData() {
        guard let email    = Auth.auth().currentUser?.email  else { return }
        let dict = ["cuenta":"\(email)","Nombre del Dispositivo": textNombreDispositivo.text!,"Tema":textTema.text!,"IP MQTT":IPServidorMQTT.text!,"Usuario":textUsuario.text!,"Contraseña": textContrasena.text!]
        self.ref.child("Configuraciones MQTT").childByAutoId().setValue(dict)
        print(dict)
    }

    @IBAction func btnGuardarConf(_ sender: UIButton) {
        self.saveFIRData()
        AlertController.showAlert(inViewController: self, title: "Información Guardada ✅", message: "La información ha sido guardada")}
    

}
