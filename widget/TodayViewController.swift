//
//  TodayViewController.swift
//  widget
//
//  Created by AWM Solutions on 9/17/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit
import NotificationCenter
import CocoaMQTT

class TodayViewController: UIViewController, NCWidgetProviding {
    let mqttClient = CocoaMQTT(clientID: "sonoff-4682", host: "34.73.245.233", port: 1883)
    
    let mqttClient01 = CocoaMQTT(clientID: "sonoff-5700", host: "34.73.245.233", port: 1883)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    @IBAction func onoffswitch(_ sender: Any) {
        mqttClient.connect()
//        let urls = "http://10.0.2.65/cm?cmnd=Power%20TOGGLE"
//        let url = NSURL(string: urls)
//        let datos :NSData? = NSData(contentsOf: url! as URL)
//        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
//        print(texto!)
    }
    
    @IBAction func onoff(_ sender: Any) {
        mqttClient01.connect()
        let urls = "http://10.0.0.89/cm?cmnd=Power%20Blink"
        let url = NSURL(string: urls)
        let datos :NSData? = NSData(contentsOf: url! as URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
    }
    
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
