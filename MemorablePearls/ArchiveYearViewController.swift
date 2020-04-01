//
//  ArchiveYearViewController.swift
//  MemorablePearls
//
//  Created by Vladislav Osin on 30.03.2020.
//  Copyright © 2020 Splash studio. All rights reserved.
//

import UIKit

class ArchiveYearViewController: UIViewController {

    @IBOutlet weak var card1: UIView!
    @IBOutlet weak var card2: UIView!
    @IBOutlet weak var card3: UIView!
    @IBOutlet weak var card4: UIView!
    @IBOutlet weak var card5: UIView!
    @IBOutlet weak var card6: UIView!
    @IBOutlet weak var textYear1: UILabel!
    @IBOutlet weak var textSeason1: UILabel!
    @IBOutlet weak var textYear2: UILabel!
    @IBOutlet weak var textSeason2: UILabel!
    @IBOutlet weak var textYear3: UILabel!
    @IBOutlet weak var textSeason3: UILabel!
    @IBOutlet weak var textYear4: UILabel!
    @IBOutlet weak var textSeason4: UILabel!
    @IBOutlet weak var textYear5: UILabel!
    @IBOutlet weak var textSeason5: UILabel!
    @IBOutlet weak var textYear6: UILabel!
    @IBOutlet weak var textSeason6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateState(UserDefaults.standard.string(forKey: "year")! as String, UserDefaults.standard.string(forKey: "seas")! as String)
    }
    
    func updateState(_ cY: String, _ cS: String) {
        textYear1.text = String(Int(cY)! - 3) + " год"
        textYear2.text = String(Int(cY)! - 2) + " год"
        textYear3.text = String(Int(cY)! - 1) + " год"
        textYear4.text = cY + " год"
        textYear5.text = String(Int(cY)! + 1) + " год"
        textYear6.text = String(Int(cY)! + 2) + " год"
        textSeason1.text = returnSeas(cS[cS.startIndex])[0] + " сезон"
        textSeason2.text = returnSeas(cS[cS.startIndex])[1] + " сезон"
        textSeason3.text = returnSeas(cS[cS.startIndex])[2] + " сезон"
        textSeason4.text = returnSeas(cS[cS.startIndex])[3] + " сезон"
        textSeason5.text = returnSeas(cS[cS.startIndex])[4] + " сезон"
        textSeason6.text = returnSeas(cS[cS.startIndex])[5] + " сезон"
    }
    
    func returnSeas(_ seas: Character) -> [String] {
        switch seas {
        case "1":
            return ["4", "5", "6", "1", "2", "3"]
        case "2":
            return ["5", "5", "1", "2", "3", "4"]
        case "3":
            return ["6", "1", "2", "3", "4", "5"]
        case "4":
            return ["1", "2", "3", "4", "5", "6"]
        case "5":
            return ["2", "3", "4", "5", "6", "1"]
        case "6":
            return ["3", "4", "5", "6", "1", "2"]
        default:
            return []
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Segue1":
            UserDefaults.standard.set(String(textSeason1.text![textSeason1.text!.startIndex]), forKey: "s")
            UserDefaults.standard.set(textYear1.text?.split(separator: " ")[0], forKey: "y")
        case "Segue2":
            UserDefaults.standard.set(String(textSeason2.text![textSeason2.text!.startIndex]), forKey: "s")
            UserDefaults.standard.set(textYear2.text?.split(separator: " ")[0], forKey: "y")
        case "Segue3":
            UserDefaults.standard.set(String(textSeason3.text![textSeason3.text!.startIndex]), forKey: "s")
            UserDefaults.standard.set(textYear3.text?.split(separator: " ")[0], forKey: "y")
        case "Segue4":
            UserDefaults.standard.set(String(textSeason4.text![textSeason4.text!.startIndex]), forKey: "s")
            UserDefaults.standard.set(textYear4.text?.split(separator: " ")[0], forKey: "y")
        case "Segue5":
            UserDefaults.standard.set(String(textSeason5.text![textSeason5.text!.startIndex]), forKey: "s")
            UserDefaults.standard.set(textYear5.text?.split(separator: " ")[0], forKey: "y")
        case "Segue6":
            UserDefaults.standard.set(String(textSeason6.text![textSeason6.text!.startIndex]), forKey: "s")
            UserDefaults.standard.set(textYear6.text?.split(separator: " ")[0], forKey: "y")
        default:
            break
        }
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
