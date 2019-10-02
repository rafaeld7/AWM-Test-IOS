//
//  BaseDeDatos.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/28/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit
import Firebase


//class BaseDeDatos: UIViewController {
//
//
////    @IBOutlet var textNombreDispositivo: UITextField!
////    @IBOutlet var textIPdeServidorMQTT: UITextField!
////    @IBOutlet var textUsuarioMQTT: UITextField!
////    @IBOutlet var textPassword: UITextField!
////    @IBOutlet var textTemaMQTT: UITextField!
//
//    var ref = DatabaseReference.init()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.ref = Database.database().reference()
//
//    }
//    //Diccionario para guardar la configuraciones del servidor MQTT en Firebase
//    func saveFIRDATA(){
//        self.ref.child("Configuraciones MQTT").childByAutoId().setValue("data")
//
//    }
//
//    @IBAction func btnGuardar() {
//        self.saveFIRDATA()
//    }
//    //   guard let email    = Auth.auth().currentUser?.email  else { return }
//    //  let dict = ["Cuenta": "\(email)" ,"Nombre del dispositvo": textNombreDispositivo.text!,"IP del ervidor": textIPdeServidorMQTT.text!,"Usuario MQTT": textUsuarioMQTT.text!,"Tema":textTemaMQTT.text!]
//    
//    //  let dict01 = ["Usuario": "rafael", "Nombre del Dispositivo": textNombreDispositivo.text!]
//}
