//
//  FirstViewController.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/10/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        boton.layer.cornerRadius = 14
        
    }//Boton
    @IBAction func onoffSonoffPorton(_ sender: Any) {
        sincrono(urls: "http://10.0.0.89/cm?cmnd=Power%20Blink")
    }
    //Boton Switch
    @IBAction func onoffsonoffNormal(_ sender: Any) {
        let urls = "http://10.0.2.65/cm?cmnd=Power%20TOGGLE"
        let url = NSURL(string: urls)
        let datos :NSData? = NSData(contentsOf: url! as URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
        myTextView.text = "\(String(describing: texto))"
    }
    
    //Funcion para la comunicacion via HTTP con la APP y Tasmota
    func sincrono(urls: String){
        let urls = "http://10.0.0.89/cm?cmnd=Power%20Blink"
        let url = NSURL(string: urls)
        let datos :NSData? = NSData(contentsOf: url! as URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
        myTextView.text = "\(String(describing: texto))"
    }
    
}

