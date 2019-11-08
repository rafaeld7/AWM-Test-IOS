//
//  MqttSettings.swift
//  AWMTest01
//
//  Created by AWM Solutions on 10/23/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//
import UIKit

let baseKey = "MQTTClient"

class MqttSettings {
    
    private init() { }
    static let shared = MqttSettings()
    
    private enum keys: String {
        case host = "host"
        case port = "port"
        case clientID = "clientID"
        case connectionTimeOut = "connectionTimeOut"
        case keepAlive = "keepAlive"
        case cleanSession = "cleanSession"
        case autoReconnect = "autoReconnect"
        case ssl = "ssl"
        case username = "username"
        case password = "password"
    }
    
    open var host: String {
        get {
            return UserDefaults.standard.string(forKey: baseKey + keys.host.rawValue) ?? "34.73.245.233"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: baseKey + keys.host.rawValue)
        }
    }
    
    var port: String {
        get {
            return UserDefaults.standard.string(forKey: baseKey + keys.port.rawValue) ?? "1883"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: baseKey + keys.port.rawValue)
        }
    }
    
    var clientID: String {
        get {
            return UserDefaults.standard.string(forKey: baseKey + keys.clientID.rawValue) ?? String(ProcessInfo().processIdentifier)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: baseKey + keys.clientID.rawValue)
        }
    }
    
    var connectionTimeOut: String {
        get {
            return UserDefaults.standard.string(forKey: baseKey + keys.connectionTimeOut.rawValue) ?? "30"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: baseKey + keys.connectionTimeOut.rawValue)
        }
    }
    
    var keepAlive: String {
        get {
            return UserDefaults.standard.string(forKey: baseKey + keys.keepAlive.rawValue) ?? "60"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: baseKey + keys.keepAlive.rawValue)
        }
    }
    
    var cleanSession: Bool {
        get {
            if let state = UserDefaults.standard.object(forKey: baseKey + keys.cleanSession.rawValue) {
                return state as! Bool
            }
            return true
        }
        set {
            UserDefaults.standard.set(newValue, forKey: baseKey + keys.cleanSession.rawValue)
        }
    }
    
    var autoReconnect: Bool {
        get {
            if let state = UserDefaults.standard.object(forKey: baseKey + keys.autoReconnect.rawValue) {
                return state as! Bool
            }
            return false
        }
        set {
            UserDefaults.standard.set(newValue, forKey: baseKey + keys.autoReconnect.rawValue)
        }
    }
    
    var ssl: Bool {
        get {
            if let state = UserDefaults.standard.object(forKey: baseKey + keys.ssl.rawValue) {
                return state as! Bool
            }
            return false
        }
        set {
            UserDefaults.standard.set(newValue, forKey: baseKey + keys.ssl.rawValue)
        }
    }
    
    var username: String {
        get {
            return UserDefaults.standard.string(forKey: baseKey + keys.username.rawValue) ?? "admin"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: baseKey + keys.username.rawValue)
        }
    }
    
    var password: String {
        get {
            return UserDefaults.standard.string(forKey: baseKey + keys.password.rawValue) ?? "admin"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: baseKey + keys.password.rawValue)
        }
    }
}

