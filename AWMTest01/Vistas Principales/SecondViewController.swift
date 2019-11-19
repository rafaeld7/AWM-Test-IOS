//
//  SecondViewController.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/10/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//
//
import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var nombreDispositivo: UITextField!
    @IBOutlet weak var IDSonoff: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var mensaje: UITextField!
    
     var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //connect data :
        self.picker.delegate = self
        self.picker.dataSource = self
        
        //input the data into the array
        pickerData = ["Encendido/Apagado", "Porton electrico"]
        
        
    }
    //Inicio de Funciones Picker
    //Numeros de columna
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Nuemro de filas
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    //Los datos a devolver para la fila y el componente (columna) que se está pasando
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData [row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mensaje.text = pickerData[row]
    }
    //Fin de Funciones Picker
    
    @IBAction func Guardar(_ sender: Any) {
        
    }
    

}

