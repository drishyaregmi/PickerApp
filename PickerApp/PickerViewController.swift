//
//  ViewController.swift
//  PickerApp
//
//  Created by Regmi, Drishya on 6/10/25.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return values.count
        }
        return values2.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return values[row]
        }
        return values2[row] //displaying the data
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
        if component == 0{
            message.text = values[row] + " " + String(describing: selectedDate.date)
        }else{
            message .text = values2[row] + " " + String(describing: selectedDate.date)
        }
    }

    @IBAction func modifyMessage(_ sender: UIDatePicker) {
        message.text = values[selectedRow] + " " + String(describing: selectedDate.date)
    }
    @IBOutlet weak var selectedDate: UIDatePicker!
    @IBOutlet weak var college: UIPickerView!   //view
    @IBOutlet weak var message: UILabel!
    
    var values = ["UHCL", "UH", "TAMU", "UT", "Rice", "TSU", "UTD", "Ohio State"]//model
    var values2 = ["UHCL2", "UH2", "TAMU2", "UT2", "Rice2", "TSU2", "UTD2", "Ohio State2"]
    var selectedRow: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.college.delegate = self
        self.college.dataSource = self
        // Do any additional setup after loading the view.
    }


}

