//
//  TestViewController.swift
//  MemorablePearls
//
//  Created by Vladislav Osin on 23.04.2020.
//  Copyright © 2020 Splash studio. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var textLink: UILabel!
    @IBOutlet weak var textVerse: UITextView!
    var listOfMP: [[String: Any]]?
    var arrayOfNumbers: [Int] = Array()
    var strVerse: String? = ""
    var indexArrayNow = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOfMP = HomeViewController.returnSeasonByName(fileName: String(UserDefaults.standard.integer(forKey: "activeSelectRowTest2") + 1) + "s")
        arrayOfNumbers = TraneViewController().returnRandomArray()
        updateState(arrayOfNumbers[indexArrayNow])
    }
    
    @IBAction func tapOnNext(_ sender: UIButton) {
        if strVerse?.cleanWhitespaceAndPunctuation.lowercased() == textVerse.text.cleanWhitespaceAndPunctuation.lowercased() {
            indexArrayNow = indexArrayNow + 1
            if indexArrayNow < 12 {
                let alert = UIAlertController(title: "Успех", message: "Поздравляем, вы ответили правильно!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Далее", style: .default, handler: toNext))
                present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Финиш", message: "Поздравляем, тестирование окончено! Вы написали правильно все стихи. Можете пройти ее еще раз или отдохнуть.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Закрыть", style: .destructive, handler: clickOnClose))
                present(alert, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Сожалеем, но вы ответили неправильно. Попробуйте еще раз.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: .destructive, handler: nil))
            present(alert, animated: true)
        }
    }
    
    func toNext(alert: UIAlertAction!) {
        updateState(indexArrayNow)
    }
    
    func clickOnClose(alert: UIAlertAction!) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateState(_ verse: Int) {
        for (index, it) in (listOfMP?.enumerated())! {
            if String(index + 1) + "q" == String(UserDefaults.standard.integer(forKey: "activeSelectRowTest1") + 1) + "q" {
                let weeks = it["weeks"] as! [[String: Any]]?
                for (i, item) in (weeks?.enumerated())! {
                    if verse == i {
                        let verses = item["verse"] as! [String: String]?
                        
                        switch UserDefaults.standard.string(forKey: "activeSelectRow") {
                        case "0":
                            strVerse = verses?["RST"]!
                        case "1":
                            strVerse = verses?["BTI"]!
                        case "2":
                            strVerse = verses?["NRP"]!
                        case "3":
                            strVerse = verses?["CSLAV"]!
                        case "4":
                            strVerse = verses?["SRP"]!
                        case "5":
                            strVerse = verses?["CASS"]!
                        case "6":
                            strVerse = verses?["IBL"]!
                        default:
                            break
                        }
                        
                        textLink.text = verses?["link_small"]!
                        
                        textVerse.text = "Введите Памятную Жемчужину здесь..."
                    }
                }
            }
        }
    }
    

}

extension String {
       var cleanWhitespaceAndPunctuation: String {
           return components(separatedBy: .punctuationCharacters)
               .joined()
               .components(separatedBy: .whitespaces)
               .joined()
               .lowercased()
       }
}
