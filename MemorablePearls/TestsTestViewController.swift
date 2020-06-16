//
//  TestsTestViewController.swift
//  MemorablePearls
//
//  Created by Vladislav Osin on 23.04.2020.
//  Copyright © 2020 Splash studio. All rights reserved.
//

import UIKit

class TestsTestViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {


    @IBOutlet weak var selectDate: UIPickerView!
    var pickerData: [[String]] = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        selectDate.delegate = self
        selectDate.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        let cY = UserDefaults.standard.string(forKey: "year")! as String
        
        pickerData = [["1 квартал", "2 квартал", "3 квартал", "4 квартал"],
        [String(Int(cY)! - 3) + " год", String(Int(cY)! - 2) + " год", String(Int(cY)! - 1) + " год", cY + " год", String(Int(cY)! + 1) + " год", String(Int(cY)! + 2) + " год"]]
        selectDate.selectRow(UserDefaults.standard.integer(forKey: "activeSelectRowTest1"), inComponent: 0, animated: false)
        selectDate.selectRow(UserDefaults.standard.integer(forKey: "activeSelectRowTest2"), inComponent: 1, animated: false)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            UserDefaults.standard.set(row, forKey: "activeSelectRowTest1")
        } else if component == 1 {
            UserDefaults.standard.set(row, forKey: "activeSelectRowTest2")
        }
    }

}
