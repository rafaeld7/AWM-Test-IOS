//
//  BaseDeDatos.swift
//  AWMTest01
//
//  Created by AWM Solutions on 10/2/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit
import Firebase

class BaseDeDatos: UIViewController {

    @IBOutlet weak var textNombreDispositivo: UITextField!
    var ref = DatabaseReference.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        
    }
    func saveFIRData() {
        guard let email    = Auth.auth().currentUser?.email  else { return }
        let dict = ["cuenta":"\(email)","Nombre del Dispositivo": textNombreDispositivo.text!]
        self.ref.child("Configuraciones MQTT").childByAutoId().setValue(dict)
        print(dict)
    }

    @IBAction func btnGuardarConf(_ sender: Any) {
        self.saveFIRData()
    }
    

}
