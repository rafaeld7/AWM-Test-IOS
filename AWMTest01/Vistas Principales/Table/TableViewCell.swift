//
//  TableViewCell.swift
//  AWMTest01
//
//  Created by AWM Solutions on 11/28/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var dispositivoLabel: UILabel!
    
    func setDispositivo (Dispositivo: Dispositivo) {
        Switch.isOn = Dispositivo.estado
        dispositivoLabel.text = Dispositivo.idDispositivo
    }
}
