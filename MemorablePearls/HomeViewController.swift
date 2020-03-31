//
//  HomeViewController.swift
//  MemorablePearls
//
//  Created by Vladislav Osin on 10.03.2020.
//  Copyright © 2020 Splash studio. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController{
    
    @IBOutlet weak var textHello: UILabel!
    @IBOutlet weak var cardVerse: UIView!
    @IBOutlet weak var textVerse: UILabel!
    @IBOutlet weak var textDate: UILabel!
    @IBOutlet weak var textLink: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    var mp: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initMainController()
    }
    
    @IBAction func cardTouched(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set(textDate.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse.text, forKey: "verseText")
        UserDefaults.standard.set(textLink.text, forKey: "verseLinkShort")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func cardLongPressed(_ sender: UILongPressGestureRecognizer) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Скопировать", style: .default, handler: clickOnCopy))
        alert.addAction(UIAlertAction(title: "Прослушать", style: .default, handler: clickOnListen))
        alert.addAction(UIAlertAction(title: "Закрыть", style: .destructive, handler: nil))

        self.present(alert, animated: true)
    }
    
    @IBAction func toArchive(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func toTrane(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func toTest(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func toSettings(_ sender: UIButton) {
         tabBarController?.selectedIndex = 3
    }
    
    func initMainController() {
        let date = Date()
        let calendar = Calendar.current
        let hourNow = calendar.component(.hour, from: date)
        let yearNow = calendar.component(.year, from: date)
        let date2 = calendar.date(byAdding: .day, value: -6, to: date)!
        let weekOfYear = calendar.component(.weekOfYear, from: date2)
    
        let userName = UserDefaults.standard.string(forKey: "name")
        
        if (userName != nil) {
            switch hourNow {
            case 5...10:
                textHello.text = "Доброе утро, " + userName! + "!"
            case 11...16:
                textHello.text = "Добрый день, " + userName! + "!"
            case 17...22:
                textHello.text = "Добрый вечер, " + userName! + "!"
            default:
                textHello.text = "Доброй ночи, " + userName! + "!"
            }
        } else {
            switch hourNow {
            case 5...10:
                textHello.text = "Доброе утро!"
            case 11...16:
                textHello.text = "Добрый день!"
            case 17...22:
                textHello.text = "Добрый вечер!"
            default:
                textHello.text = "Доброй ночи!"
            }
        }
        
        if (UserDefaults.standard.string(forKey: "activeSelectRow") == nil) {
            UserDefaults.standard.set("1", forKey: "activeSelectRow")
        }
        
        UserDefaults.standard.set(yearNow, forKey: "year")
        returnYears(yearNow)
        
        let listOfMP = HomeViewController.returnSeasonByName(fileName: UserDefaults.standard.string(forKey: "seas")!)
        
        for (index, it) in (listOfMP?.enumerated())! {
            let startWeek = it["start_week"] as! Int
            let endWeek = it["end_week"] as! Int
            if startWeek ... endWeek ~= weekOfYear {
                switch index {
                case 0:
                    cardVerse.backgroundColor = UIColor(named: "cl_quart_1")
                    UserDefaults.standard.set("1q", forKey: "q")
                    UserDefaults.standard.set("1q", forKey: "qq")
                case 1:
                    cardVerse.backgroundColor = UIColor(named: "cl_quart_2")
                    UserDefaults.standard.set("2q", forKey: "q")
                    UserDefaults.standard.set("2q", forKey: "qq")
                case 2:
                    cardVerse.backgroundColor = UIColor(named: "cl_quart_3")
                    UserDefaults.standard.set("3q", forKey: "q")
                    UserDefaults.standard.set("3q", forKey: "qq")
                case 3:
                    cardVerse.backgroundColor = UIColor(named: "cl_quart_4")
                    UserDefaults.standard.set("4q", forKey: "q")
                    UserDefaults.standard.set("4q", forKey: "qq")
                default:
                    break
                }
                let weeks = it["weeks"] as! [[String: Any]]?
                for (_, item) in (weeks?.enumerated())! {
                    let numWeekInYear = item["num_week_in_year"] as! Int
                    if weekOfYear == numWeekInYear {
                        let numOfWeek = item["num_week"] as! Int
                        textDate.text = String(numOfWeek) + " неделя, " + returnDates(numWeekInYear, yearNow)[0] + " – " + returnDates(numWeekInYear, yearNow)[1]
                        UserDefaults.standard.set(numOfWeek, forKey: "v")
                        let verses = item["verse"] as! [String: String]?
                        switch UserDefaults.standard.string(forKey: "activeSelectRow") {
                        case "0":
                            textVerse.text = verses?["RST"]
                        case "1":
                            textVerse.text = verses?["BTI"]
                        case "2":
                            textVerse.text = verses?["NRP"]
                        case "3":
                            textVerse.text = verses?["CSLAV"]
                        case "4":
                            textVerse.text = verses?["SRP"]
                        case "5":
                            textVerse.text = verses?["CASS"]
                        case "6":
                            textVerse.text = verses?["IBL"]
                        default:
                            break
                        }
                        
                        textLink.text = verses?["link_small"]

                        UserDefaults.standard.set(verses?["link_full"], forKey: "verseLinkLong")
                    }
                }
            }
        }
    }
    
    func returnDates(_ w: Int, _ y: Int) -> [String] {
        let sdf = DateFormatter()
        sdf.dateFormat = "dd.MM.YYYY"
        
        var date = DateComponents()
        
        var valW = w + 1

        if w == 52 {
            valW = 1
            date.year = y + 1
        } else {
            date.year = y
        }
        
        let cal = Calendar(identifier: .gregorian)
        let dateNow = cal.date(bySetting: .weekOfYear, value: valW, of: cal.date(from: date)!)!
        
        let sunday = cal.date(from: cal.dateComponents([.yearForWeekOfYear, .weekOfYear], from: dateNow))
        let startDay = cal.date(byAdding: .day, value: -1, to: sunday!)!
        let endDay = cal.date(byAdding: .day, value: 5, to: sunday!)!
        
        var end = sdf.string(from: endDay)
        if w == 52 {
            if end.split(separator: ".")[0] == "31" && end.split(separator: ".")[1] == "12" {
                end = "31.12." + String(y)
            }
        }
        
        return [sdf.string(from: startDay), end]
    }
    
    func returnYears(_ cY: Int) {
        var isContinue = true
        var i = cY
        
        while isContinue {
            switch i {
            case 2017:
                UserDefaults.standard.set("1s", forKey: "seas")
                isContinue = false
            case 2018:
                UserDefaults.standard.set("2s", forKey: "seas")
                isContinue = false
            case 2019:
                UserDefaults.standard.set("3s", forKey: "seas")
                isContinue = false
            case 2020:
                UserDefaults.standard.set("4s", forKey: "seas")
                isContinue = false
            case 2021:
                UserDefaults.standard.set("5s", forKey: "seas")
                isContinue = false
            case 2022:
                UserDefaults.standard.set("6s", forKey: "seas")
                isContinue = false
            default:
                i -= 6
            }
        }
    }
    
    func clickOnCopy(alert: UIAlertAction!) {
        UIPasteboard.general.string = textVerse.text
        let alert = UIAlertController(title: "Скопировано в буфер обмена!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    func clickOnListen(alert: UIAlertAction!) {
        let seas = UserDefaults.standard.string(forKey: "seas")! as String
        let q = UserDefaults.standard.string(forKey: "q")! as String
        let v = UserDefaults.standard.string(forKey: "v")! as String
        
        let path = Bundle.main.path(forResource: "audio/" +  seas + "/" + q + "/" + v + ".mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            mp = try AVAudioPlayer(contentsOf: url)
            mp?.play()
        } catch {}
    }
    
    static func returnSeasonByName(fileName: String) -> [[String: Any]]? {
        var json: Any = ""
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                json = try! JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            } catch {}
        }
        
        let jsonArray = (json as? [[String: Any]])
        
        return jsonArray
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
