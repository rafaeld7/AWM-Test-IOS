//
//  TestMQTT.swift
//  AWMTest01
//
//  Created by AWM Solutions on 10/29/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit

class TestMQTT: UIViewController {

    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var choseTopicButton: UIButton!
    @IBOutlet weak var countSubscriptions: UITextField!
    @IBOutlet weak var currentTopicLabel: UILabel!
    @IBOutlet weak var currentStateLabel: UILabel!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var disconnectButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var receivedMessages: [(topic: String, message: String)] = []
    var isConnected = false
    var currentTopic: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboard()
        
        MqttManager.shared.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        messageTextField.setBottomBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    //**************************************
    // MARK: - Actions
    
    // Handling Buttons from header
    
    @IBAction func headerButtonActions(_ sender: UIButton) {
        
    switch sender.tag {
        case 0:
            if !isConnected {
                receivedMessages.removeAll()
                tableView.reloadData()
                MqttManager.shared.connect(host: MqttSettings.shared.host,
                                           port: Int(MqttSettings.shared.port)!,
                                           username: MqttSettings.shared.username,
                                           password: MqttSettings.shared.password,
                                           cleanSession: MqttSettings.shared.cleanSession)
            }
        case 1:
            if isConnected {
                MqttManager.shared.disconnect()
            }
        case 2:
            print("Press Settings Button")
        default:
            print("default case")
        }
    }
    
    
    
//Añadir una nueva subscripcion
    @IBAction func subscribe(_ sender: UIButton) {
        
        
        let alert = UIAlertController(title: "Subscribirse", message: "Registre el topic,a la que quieres suscribirte", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "Subscribirse", style: .default, handler: { [weak alert] (_) in
            if let textField = alert?.textFields![0], !(textField.text?.isEmpty)! {
                MqttManager.shared.subscribe(topic: textField.text!)
                self.countSubscriptions.text = "My subsciptions (\(MqttManager.shared.subscribedTopics.count))"
                self.setupButtonStyle(button: self.choseTopicButton, alpha: 1, isEnabled: true)
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // Selecting the current subscription from the list for work
    @IBAction func chooseTopic(_ sender: UIButton) {
        let optionMenu = UIAlertController(title: nil, message: "Current subscription", preferredStyle: .actionSheet)
        
        for topic in MqttManager.shared.subscribedTopics {
            let newAction = UIAlertAction(title: topic, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                self.currentTopicLabel.text = "Current topic: " + topic
                self.currentTopic = topic
                self.editingMessage(true)
            })
            optionMenu.addAction(newAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in })
        
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    // Send a message to topic / subscription
    @IBAction func publishMessage(_ sender: UIButton) {
        if let topic = currentTopic {
            MqttManager.shared.publish(message: messageTextField.text!, topic: topic)
        } else {
            print("Topic is not selected")
        }
    }
    
    
    
    func setupButtonStyle(button: UIButton, alpha: CGFloat, isEnabled: Bool) {
        button.alpha = alpha
        button.isEnabled = isEnabled
    }
    
    
    // Handling the input message
    @IBAction func editingMessage(_ sender: Any) {
        if let text = messageTextField.text, !text.isEmpty, isConnected, !MqttManager.shared.subscribedTopics.isEmpty, currentTopic != nil {
            self.setupButtonStyle(button: sendButton, alpha: 1, isEnabled: true)
        } else {
            self.setupButtonStyle(button: sendButton, alpha: 0.5, isEnabled: false)
        }
    }
    
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension TestMQTT: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivedMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessageTableViewCell
        cell.topicLabel.text = "Topic: " + receivedMessages[indexPath.row].topic
        cell.messageLabel.text = receivedMessages[indexPath.row].message
        
        return cell
    }
}

// MARK: - MqttManagerDelegate
extension TestMQTT: MqttManagerDelegate {
    func onMqttConnected() {
        isConnected = true
        currentStateLabel.text = "Conectado"
        currentStateLabel.textColor = UIColor(hex: 0x4996FA)
        setupButtonStyle(button: subscribeButton, alpha:1, isEnabled: true)
        setupButtonStyle(button: connectButton, alpha: 0.5, isEnabled: false)
        setupButtonStyle(button: disconnectButton, alpha: 1, isEnabled: true)
        editingMessage(true)
    }

    func onMqttDisconnected() {
        isConnected = false
        currentStateLabel.text = "Desconectado"
        currentStateLabel.textColor = UIColor(hex: 0xC1001D)
        setupButtonStyle(button: subscribeButton, alpha: 0.5, isEnabled: false)
        setupButtonStyle(button: connectButton, alpha: 1, isEnabled: true)
        setupButtonStyle(button: disconnectButton, alpha: 0.5, isEnabled: false)
        currentTopic = nil
        messageTextField.text = ""
        countSubscriptions.text = "My subsciptions (0)"
        editingMessage(true)
    }

    @objc func onMqttMessageReceived(message: String, topic: String) {
        receivedMessages.append((topic: topic, message: message))
        self.tableView.reloadData()
    }

    func onMqttError(message: String) { }
}
