//
//  ArchiveQuartViewController.swift
//  MemorablePearls
//
//  Created by Vladislav Osin on 30.03.2020.
//  Copyright © 2020 Splash studio. All rights reserved.
//

import UIKit

class ArchiveQuartViewController: UIViewController {

    @IBOutlet weak var textDate1: UILabel!
    @IBOutlet weak var textName1: UILabel!
    @IBOutlet weak var textDate2: UILabel!
    @IBOutlet weak var textName2: UILabel!
    @IBOutlet weak var textDate3: UILabel!
    @IBOutlet weak var textName3: UILabel!
    @IBOutlet weak var textDate4: UILabel!
    @IBOutlet weak var textName4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "mode1") {
            UserDefaults.standard.set(false, forKey: "mode1")
            switch UserDefaults.standard.string(forKey: "q")! {
            case "1q":
                performSegue(withIdentifier: "Segue1q", sender: view)
            case "2q":
                performSegue(withIdentifier: "Segue2q", sender: view)
            case "3q":
                performSegue(withIdentifier: "Segue3q", sender: view)
            case "4q":
                performSegue(withIdentifier: "Segue4q", sender: view)
            default:
                break
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initQuarts()
    }
    
    func initQuarts() {
        let listOfMP = HomeViewController.returnSeasonByName(fileName: UserDefaults.standard.string(forKey: "s")! + "s")
        
        for (index, it) in (listOfMP?.enumerated())! {
            let nameQuarter = it["name_quarter"] as! String
            let startWeek = it["start_week"] as! Int
            let endWeek = it["end_week"] as! Int
            switch index {
            case 0:
                textName1.text = nameQuarter
                textDate1.text = returnDates(startWeek, endWeek, Int(UserDefaults.standard.string(forKey: "y")!)!)[0] + " - " + returnDates(startWeek, endWeek, Int(UserDefaults.standard.string(forKey: "y")!)!)[1]
            case 1:
                textName2.text = nameQuarter
                textDate2.text = returnDates(startWeek, endWeek, Int(UserDefaults.standard.string(forKey: "y")!)!)[0] + " - " + returnDates(startWeek, endWeek, Int(UserDefaults.standard.string(forKey: "y")!)!)[1]
            case 2:
                textName3.text = nameQuarter
                textDate3.text = returnDates(startWeek, endWeek, Int(UserDefaults.standard.string(forKey: "y")!)!)[0] + " - " + returnDates(startWeek, endWeek, Int(UserDefaults.standard.string(forKey: "y")!)!)[1]
            case 3:
                textName4.text = nameQuarter
                textDate4.text = returnDates(startWeek, endWeek, Int(UserDefaults.standard.string(forKey: "y")!)!)[0] + " - " + returnDates(startWeek, endWeek, Int(UserDefaults.standard.string(forKey: "y")!)!)[1]
            default: break
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Segue1q":
            UserDefaults.standard.set("1q", forKey: "q")
        case "Segue2q":
            UserDefaults.standard.set("2q", forKey: "q")
        case "Segue3q":
            UserDefaults.standard.set("3q", forKey: "q")
        case "Segue4q":
            UserDefaults.standard.set("4q", forKey: "q")
        default:
            break
        }
    }
    
    func returnDates(_ w1: Int, _ w2: Int, _ y: Int) -> [String] {
        let sdf = DateFormatter()
        sdf.dateFormat = "dd.MM.YYYY"
        
        var date1 = DateComponents()
        date1.year = y
        
        var valW = w2 + 1
        
        var date2 = DateComponents()
        if w2 == 52 {
            valW = 1
            date2.year = y + 1
        } else {
            date2.year = y
        }
        
        let cal = Calendar(identifier: .gregorian)
        let dateNow1 = cal.date(bySetting: .weekOfYear, value: w1 + 1, of: cal.date(from: date1)!)!
        let dateNow2 = cal.date(bySetting: .weekOfYear, value: valW, of: cal.date(from: date2)!)!
        
        let sunday1 = cal.date(from: cal.dateComponents([.yearForWeekOfYear, .weekOfYear], from: dateNow1))
        let sunday2 = cal.date(from: cal.dateComponents([.yearForWeekOfYear, .weekOfYear], from: dateNow2))
        let startDay = cal.date(byAdding: .day, value: -1, to: sunday1!)!
        let endDay = cal.date(byAdding: .day, value: 5, to: sunday2!)!
        
        var end = sdf.string(from: endDay)
        
        if w2 == 52 {
            if end.split(separator: ".")[0] == "31" && end.split(separator: ".")[1] == "12" {
                end = "31.12." + String(y)
            }
        }
        
        return [sdf.string(from: startDay), end]
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
