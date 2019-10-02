
//  SignInVC.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/19/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//
// Add this to the header of your file, e.g. in ViewController.m
// after #import "ViewController.h"
//import FBSDKCoreKit
//import FBSDKLoginKit
import UIKit
import Firebase
//import FacebookLogin



class SignInVC: UIViewController {
    
    //@IBOutlet weak var butt: FBSDKLoginButton!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func onSignInTapped(_ sender: Any) {
        
        guard let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            else {
                AlertController.showAlert(inViewController: self, title:"Falta información", message: "Por favor, rellene todos los campos obligatorios")
                return
        }
        // Iniciar seccion utilizadond FIREBASE link de video: https://www.youtube.com/watch?v=TN8dlspR1P0
        
        Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error)
            in guard error == nil else {
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            if ( user.user.isEmailVerified == false){
                user.user.sendEmailVerification(completion: nil)
                
            }
                user.user.isEmailVerified ? print("verificado") : print("aun sin verificar")
            
            if (user.user.isEmailVerified == false){
                AlertController.showAlert(inViewController: self, title: "Confirmar Correo electrónico📨", message: "Busque en el buzón de su correo \(email) un mesaje enviado desde la dirección Noreply@Awm-Ios.Firebaseapp.Com que contiene el link de confirmación ")} else {
//                AlertController.showAlert(inViewController: self, title: "Bienvenido✅", message: "Su correo ya esta confirmado, favor de  pulsar -Iniciar sesión- para continuar ")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
                
            }
            
            print(user.user.email ?? "MISSING EMAIL")
            print(user.user.displayName ?? "MISSING DISPLAY NAME")
            print(user.user.uid)
            
           self.performSegue(withIdentifier: "signInSegue", sender: nil)
        })
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "signInSegue"{
//            let vc = segue.destination as! FirstViewController
//
//        }
//   }
    
    
    
  //  @IBAction func loginConFacebook(_ sender: Any) {
 //   }
    
 
}
