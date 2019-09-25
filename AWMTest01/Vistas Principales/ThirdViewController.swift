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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = Auth.auth().currentUser?.displayName else { return }
        labelEmail.text = "\(username)"
        
        }
    @IBAction func SignOut(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOutSegue", sender: nil)
        } catch {
            print(error)
        }
    }
}


