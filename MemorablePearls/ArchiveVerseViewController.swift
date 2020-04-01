//
//  ArchiveVerseViewController.swift
//  MemorablePearls
//
//  Created by Vladislav Osin on 01.04.2020.
//  Copyright © 2020 Splash studio. All rights reserved.
//

import UIKit
import AVFoundation

class ArchiveVerseViewController: UIViewController {
    
    @IBOutlet weak var cardVerse1: UIView!
    @IBOutlet weak var cardVerse2: UIView!
    @IBOutlet weak var cardVerse3: UIView!
    @IBOutlet weak var cardVerse4: UIView!
    @IBOutlet weak var cardVerse5: UIView!
    @IBOutlet weak var cardVerse6: UIView!
    @IBOutlet weak var cardVerse7: UIView!
    @IBOutlet weak var cardVerse8: UIView!
    @IBOutlet weak var cardVerse9: UIView!
    @IBOutlet weak var cardVerse10: UIView!
    @IBOutlet weak var cardVerse11: UIView!
    @IBOutlet weak var cardVerse12: UIView!
    @IBOutlet weak var cardVerse13: UIView!
    @IBOutlet weak var textDate1: UILabel!
    @IBOutlet weak var textDate2: UILabel!
    @IBOutlet weak var textDate3: UILabel!
    @IBOutlet weak var textDate4: UILabel!
    @IBOutlet weak var textDate5: UILabel!
    @IBOutlet weak var textDate6: UILabel!
    @IBOutlet weak var textDate7: UILabel!
    @IBOutlet weak var textDate8: UILabel!
    @IBOutlet weak var textDate9: UILabel!
    @IBOutlet weak var textDate10: UILabel!
    @IBOutlet weak var textDate11: UILabel!
    @IBOutlet weak var textDate12: UILabel!
    @IBOutlet weak var textDate13: UILabel!
    @IBOutlet weak var textVerse1: UILabel!
    @IBOutlet weak var textVerse2: UILabel!
    @IBOutlet weak var textVerse3: UILabel!
    @IBOutlet weak var textVerse4: UILabel!
    @IBOutlet weak var textVerse5: UILabel!
    @IBOutlet weak var textVerse6: UILabel!
    @IBOutlet weak var textVerse7: UILabel!
    @IBOutlet weak var textVerse8: UILabel!
    @IBOutlet weak var textVerse9: UILabel!
    @IBOutlet weak var textVerse10: UILabel!
    @IBOutlet weak var textVerse11: UILabel!
    @IBOutlet weak var textVerse12: UILabel!
    @IBOutlet weak var textVerse13: UILabel!
    @IBOutlet weak var textLink1: UILabel!
    @IBOutlet weak var textLink2: UILabel!
    @IBOutlet weak var textLink3: UILabel!
    @IBOutlet weak var textLink4: UILabel!
    @IBOutlet weak var textLink5: UILabel!
    @IBOutlet weak var textLink6: UILabel!
    @IBOutlet weak var textLink7: UILabel!
    @IBOutlet weak var textLink8: UILabel!
    @IBOutlet weak var textLink9: UILabel!
    @IBOutlet weak var textLink10: UILabel!
    @IBOutlet weak var textLink11: UILabel!
    @IBOutlet weak var textLink12: UILabel!
    @IBOutlet weak var textLink13: UILabel!
    @IBOutlet weak var imgPlay: UIImageView!
    var isPlay = false
    var mp: AVAudioPlayer?
    var textForCopy = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initVerses()
        
    }
    
    @IBAction func tapMusic(_ sender: UITapGestureRecognizer) {
        if isPlay {
            mp?.pause()
            isPlay = false
            imgPlay.image = UIImage(named: "ic_play_arrow_black_24dp")
        } else {
            mp?.play()
            isPlay = true
            imgPlay.image = UIImage(named: "ic_pause_black_24dp")
        }
        
    }
    
    @IBAction func tapCard1(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("1", forKey: "v")
        UserDefaults.standard.set(textDate1.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse1.text, forKey: "verseText")
        UserDefaults.standard.set(textLink1.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink1"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard2(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("2", forKey: "v")
        UserDefaults.standard.set(textDate2.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse2.text, forKey: "verseText")
        UserDefaults.standard.set(textLink2.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink2"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard3(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("3", forKey: "v")
        UserDefaults.standard.set(textDate3.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse3.text, forKey: "verseText")
        UserDefaults.standard.set(textLink3.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink3"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard4(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("4", forKey: "v")
        UserDefaults.standard.set(textDate4.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse4.text, forKey: "verseText")
        UserDefaults.standard.set(textLink4.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink4"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard5(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("5", forKey: "v")
        UserDefaults.standard.set(textDate5.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse5.text, forKey: "verseText")
        UserDefaults.standard.set(textLink5.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink5"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard6(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("6", forKey: "v")
        UserDefaults.standard.set(textDate6.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse6.text, forKey: "verseText")
        UserDefaults.standard.set(textLink6.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink6"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard7(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("7", forKey: "v")
        UserDefaults.standard.set(textDate7.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse7.text, forKey: "verseText")
        UserDefaults.standard.set(textLink7.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink7"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard8(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("8", forKey: "v")
        UserDefaults.standard.set(textDate8.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse8.text, forKey: "verseText")
        UserDefaults.standard.set(textLink8.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink8"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard9(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("9", forKey: "v")
        UserDefaults.standard.set(textDate9.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse9.text, forKey: "verseText")
        UserDefaults.standard.set(textLink9.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink9"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard10(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("10", forKey: "v")
        UserDefaults.standard.set(textDate10.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse10.text, forKey: "verseText")
        UserDefaults.standard.set(textLink10.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink10"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard11(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("11", forKey: "v")
        UserDefaults.standard.set(textDate11.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse11.text, forKey: "verseText")
        UserDefaults.standard.set(textLink11.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink11"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard12(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("12", forKey: "v")
        UserDefaults.standard.set(textDate12.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse12.text, forKey: "verseText")
        UserDefaults.standard.set(textLink12.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink12"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tapCard13(_ sender: UITapGestureRecognizer) {
        UserDefaults.standard.set("13", forKey: "v")
        UserDefaults.standard.set(textDate13.text, forKey: "verseDate")
        UserDefaults.standard.set(textVerse13.text, forKey: "verseText")
        UserDefaults.standard.set(textLink13.text, forKey: "verseLinkShort")
        UserDefaults.standard.set(UserDefaults.standard.string(forKey: "fullLink13"), forKey: "verseLinkLong")
        present(DetailViewController(), animated: true, completion: nil)
    }
    
    @IBAction func longPress1(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("1", forKey: "v")
        textForCopy = textVerse1.text! + " " + textLink1.text!
        callAlert()
    }
    
    @IBAction func longPress2(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("2", forKey: "v")
        textForCopy = textVerse2.text! + " " + textLink2.text!
        callAlert()
    }
    
    @IBAction func longPress3(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("3", forKey: "v")
        textForCopy = textVerse3.text! + " " + textLink3.text!
        callAlert()
    }
    
    @IBAction func longPress4(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("4", forKey: "v")
        textForCopy = textVerse4.text! + " " + textLink4.text!
        callAlert()
    }
    
    @IBAction func longPress5(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("5", forKey: "v")
        textForCopy = textVerse5.text! + " " + textLink5.text!
        callAlert()
    }
    
    @IBAction func longPress6(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("6", forKey: "v")
        textForCopy = textVerse6.text! + " " + textLink6.text!
        callAlert()
    }
    
    @IBAction func longPress7(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("7", forKey: "v")
        textForCopy = textVerse7.text! + " " + textLink7.text!
        callAlert()
    }
    
    @IBAction func longPress8(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("8", forKey: "v")
        textForCopy = textVerse8.text! + " " + textLink8.text!
        callAlert()
    }
    
    @IBAction func longPress9(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("9", forKey: "v")
        textForCopy = textVerse9.text! + " " + textLink9.text!
        callAlert()
    }
    
    @IBAction func longPress10(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("10", forKey: "v")
        textForCopy = textVerse10.text! + " " + textLink10.text!
        callAlert()
    }
    
    @IBAction func longPress11(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("11", forKey: "v")
        textForCopy = textVerse11.text! + " " + textLink11.text!
        callAlert()
    }
    
    @IBAction func longPress12(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("12", forKey: "v")
        textForCopy = textVerse12.text! + " " + textLink12.text!
        callAlert()
    }
    
    @IBAction func longPress13(_ sender: UILongPressGestureRecognizer) {
        UserDefaults.standard.set("1", forKey: "v")
        textForCopy = textVerse13.text! + " " + textLink13.text!
        callAlert()
    }

    func initVerses() {
        let seas = UserDefaults.standard.string(forKey: "s")! as String
        let q = UserDefaults.standard.string(forKey: "q")! as String
        let path = Bundle.main.path(forResource: "audio/" +  seas + "s/" + q + "/all.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            mp = try AVAudioPlayer(contentsOf: url)
            mp?.numberOfLoops = -1
        } catch {}
        switch UserDefaults.standard.string(forKey: "q") {
        case "1q":
            cardVerse1.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse2.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse3.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse4.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse5.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse6.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse7.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse8.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse9.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse10.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse11.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse12.backgroundColor = UIColor(named: "cl_quart_1")
            cardVerse13.backgroundColor = UIColor(named: "cl_quart_1")
        case "2q":
            cardVerse1.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse2.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse3.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse4.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse5.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse6.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse7.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse8.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse9.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse10.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse11.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse12.backgroundColor = UIColor(named: "cl_quart_2")
            cardVerse13.backgroundColor = UIColor(named: "cl_quart_2")
        case "3q":
            cardVerse1.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse2.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse3.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse4.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse5.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse6.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse7.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse8.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse9.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse10.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse11.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse12.backgroundColor = UIColor(named: "cl_quart_3")
            cardVerse13.backgroundColor = UIColor(named: "cl_quart_3")
        case "4q":
            cardVerse1.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse2.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse3.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse4.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse5.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse6.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse7.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse8.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse9.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse10.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse11.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse12.backgroundColor = UIColor(named: "cl_quart_4")
            cardVerse13.backgroundColor = UIColor(named: "cl_quart_4")
        default:
            break
        }
        
        let listOfMP = HomeViewController.returnSeasonByName(fileName: UserDefaults.standard.string(forKey: "s")! + "s")
        
        for (index, it) in (listOfMP?.enumerated())! {
            if String(index + 1) + "q" == UserDefaults.standard.string(forKey: "q") {
                let weeks = it["weeks"] as! [[String: Any]]?
                for (_, item) in (weeks?.enumerated())! {
                    let numOfWeek = item["num_week"] as! Int
                    let numWeekInYear = item["num_week_in_year"] as! Int
                    let verses = item["verse"] as! [String: String]?
                    
                    if let textDate = value(forKey: "textDate" + String(numOfWeek)) as? UILabel {
                        textDate.text = String(numOfWeek) + " неделя, " + returnDates(numWeekInYear, Int(UserDefaults.standard.string(forKey: "y")!)!)[0] + " – " + returnDates(numWeekInYear, Int(UserDefaults.standard.string(forKey: "y")!)!)[1]
                    }
                    
                    if let textVerse = value(forKey: "textVerse" + String(numOfWeek)) as? UILabel {
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
                    }
                    
                    UserDefaults.standard.set(verses?["link_full"], forKey: "fullLink"+String(numOfWeek))
                    
                    if let textLink = value(forKey: "textLink" + String(numOfWeek)) as? UILabel {
                        textLink.text = verses?["link_small"]
                    }
                }
            }
        }
    }
    
    func callAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Скопировать", style: .default, handler: clickOnCopy))
        alert.addAction(UIAlertAction(title: "Прослушать", style: .default, handler: clickOnListen))
        alert.addAction(UIAlertAction(title: "Закрыть", style: .destructive, handler: nil))

        self.present(alert, animated: true)
    }
    
    func clickOnCopy(alert: UIAlertAction!) {
        UIPasteboard.general.string = textForCopy
        let alert = UIAlertController(title: "Скопировано в буфер обмена!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    func clickOnListen(alert: UIAlertAction!) {
        let seas = UserDefaults.standard.string(forKey: "s")! as String
        let q = UserDefaults.standard.string(forKey: "q")! as String
        let v = UserDefaults.standard.string(forKey: "v")! as String
        
        let path = Bundle.main.path(forResource: "audio/" +  seas + "s/" + q + "/" + v + ".mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            mp = try AVAudioPlayer(contentsOf: url)
            mp?.play()
        } catch {}
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
