//
//  ThirdViewController.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/10/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit
import Firebase

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var labelEmail: UILabel!
    //@IBOutlet weak var labelUsername: UILabel!
    
//    var ref = DatabaseReference.init()
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Nombre de usuario
       // guard let username = Auth.auth().currentUser?.displayName else { return }
       //  labelUsername.text = "\(username)"
        guard let email    = Auth.auth().currentUser?.email  else { return }
        labelEmail.text = "\(email)"
        
        //Agregar Datos a FIREBASE
//        self.ref = Database.database().reference()
//        self.saveData()
//
//
        }
    
    @IBAction func SignOut(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOutSegue", sender: nil)
        } catch {
            print(error)
        }
    }
    
//    func saveData(){
//        self.ref.child("Dispositivo").childByAutoId().setValue("Sonoff")
//        print(ref.childByAutoId())
//    }
}


