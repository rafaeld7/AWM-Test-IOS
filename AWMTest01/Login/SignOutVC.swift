//
//  SignOutVC.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/19/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit
import Firebase

class SignOutVC: UIViewController {

    @IBOutlet weak var label: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = Auth.auth().currentUser?.displayName else { return }
        
        label.text = "Hello \(username)"
    }
    @IBAction func onSignOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOutSegue", sender: nil)
        } catch {
            print(error)
        }
    }
}
