
//  SignUpVC.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/19/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
// link de video :https://www.youtube.com/watch?v=TN8dlspR1P0

import UIKit
import Firebase

class SignUpVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        userNameTF.delegate = self
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
    } //Guardar teclado LINK:  https://www.youtube.com/watch?v=ahzvP8ulebk
    //funcion para cerrar teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //fin cerra teclado
}
