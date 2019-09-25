//
//  AlertController.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/23/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//


import UIKit

class AlertController {
    static func showAlert(inViewController: UIViewController, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
        
    }
}
