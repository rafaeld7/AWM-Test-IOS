//
//  SecondViewController.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/10/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//
//
import UIKit
import Firebase

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var nombreDispositivo: UITextField!
    @IBOutlet weak var IDSonoff: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var mensaje: UITextField!
    @IBOutlet weak var mensaje1: UILabel!
    
    var pickerData: [String] = [String]()
    var ref = DatabaseReference.init()
    var refHandler: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        //Firebase BD
        ref = Database.database().reference()
       // refHandler = ref.child("Usuario").child((Auth.auth().currentUser?.uid)!).child("Funcion").observe(.value, with: { (Snapshot) in
          //  print("Funcion : \(Snapshot.value!) ")
          //  self.mensaje1.text = Snapshot.value as? String
       // })
        //connect data :
        self.picker.delegate = self
        self.picker.dataSource = self
        //input the data into the array
        pickerData = ["-Seleccione-","Encendido/Apagado", "Porton electrico"]
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
      //var dict01 = ["\(pickerData[0])":"2","\(pickerData[1])":"3"]
    }
    //Fin de Funciones Picker
    
    //Recolectar informacion en Firebase BD
    @IBAction func Guardar(_ sender: Any) {
     //   let dictAgregarDispositivo = ["Nombre":nombreDispositivo.text!,"ID Dispositivo":IDSonoff.text!,"Funcion":mensaje.text!]
     //   self.ref.child("Usuario").child((Auth.auth().currentUser?.uid)!).setValue(dictAgregarDispositivo)
        
        
        
        
    }
    

}

