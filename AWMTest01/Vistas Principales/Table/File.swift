//
//  File.swift
//  AWMTest01
//
//  Created by AWM Solutions on 11/28/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import Foundation
import UIKit

class Dispositivo {
    
    var idDispositivo : String = ""
    var funciom: String = ""
    var estado: Bool
    
    init(idDispositivo: String, funcion: String, estado: Bool) {
        self.idDispositivo = idDispositivo
        self.funciom = funcion
        self.estado = estado
        
    }
}
