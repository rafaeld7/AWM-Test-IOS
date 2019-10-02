
//  SignUpVC.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/19/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
// link de video :https://www.youtube.com/watch?v=TN8dlspR1P0

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        guard let username = userNameTF.text,
        username != "",
        let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
        else {
            AlertController.showAlert(inViewController: self, title: "Falta información", message: "Por favor, rellene todos los campos")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                return
                
            }
            guard let user = user else { return }
            print(user.user.email ?? "MISSING EMAIL")
            print(user.user.uid)
            
           // user.user.isEmailVerified ? print("verificado") : print("aun sin verificar")
            //
            //confirmacion de correo electronico
//            if ( user.user.isEmailVerified == false){
//                user.user.sendEmailVerification(completion: nil)
//
//            }
//           user.user.isEmailVerified ? print("verificado") : print("aun sin verificar")
//
//            if (user.user.isEmailVerified == false){
//                AlertController.showAlert(inViewController: self, title: "Confirmar Correo electrónico✅", message: "Busque en el buzón de su correo \(email) un mesaje enviado desde la dirección Noreply@Awm-Ios.Firebaseapp.Com que contiene el link de confirmación ")//} else {
//                self.performSegue(withIdentifier: "backtoSignIn", sender: nil)
//            }
//            if (user.user.isEmailVerified == true){
//                 self.performSegue(withIdentifier: "backtoSignIn", sender: nil)
//            }
//
//            //

            let changeRequest = user.user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: {(error)
                in guard error == nil else {
                    AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                       return
                }
                
               self.performSegue(withIdentifier: "backtoSignIn", sender: nil)
                
            })
            
        })
    }
}
