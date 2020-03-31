//
//  SettingsViewController.swift
//  MemorablePearls
//
//  Created by Vladislav Osin on 10.03.2020.
//  Copyright © 2020 Splash studio. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var translatePicker: UIPickerView!
    
    var listOfTranslates: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.translatePicker.delegate = self
        self.translatePicker.dataSource = self
        
        listOfTranslates = ["Синодальный перевод", "Институт перевода Библии", "Новый русский перевод", "Церковнославянский перевод", "Современный русский перевод", "Перевод Епископа Кассиана", "Перевод Международной Библейской лиги"]
        
        translatePicker.selectRow(UserDefaults.standard.integer(forKey: "activeSelectRow"), inComponent: UserDefaults.standard.integer(forKey: "activeSelectComponent"), animated: false)
        
        textFieldName.text = UserDefaults.standard.string(forKey: "name")
        
        textFieldName.addTarget(self, action: #selector(textFieldNameDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @IBAction func clickOnView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func textFieldNameDidChange(_ textField: UITextField) {
        UserDefaults.standard.set(textField.text, forKey: "name")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfTranslates.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfTranslates[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(row, forKey: "activeSelectRow")
        UserDefaults.standard.set(component, forKey: "activeSelectComponent")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
