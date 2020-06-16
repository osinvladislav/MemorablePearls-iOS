//
//  TraneViewController.swift
//  MemorablePearls
//
//  Created by Vladislav Osin on 20.04.2020.
//  Copyright © 2020 Splash studio. All rights reserved.
//

import UIKit

class TraneViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var textLink: UILabel!
    @IBOutlet weak var textVerse: UILabel!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var btnYes: UIButton!
    var listOfMP: [[String: Any]]?
    var arrayOfNumbers: [Int] = Array()
    var nextArrayOfNumbers: [Int] = Array()
    var strLink: String! = ""
    var strVerse: String! = ""
    var showMode = "link"
    var indexArrayNow = 0
    var numOfElems = 12
    var newNumOfElems = 12
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch UserDefaults.standard.integer(forKey: "activeSelectRowTrane1") {
        case 0:
            cardView.backgroundColor = UIColor(named: "cl_quart_1")
        case 1:
            cardView.backgroundColor = UIColor(named: "cl_quart_2")
        case 2:
            cardView.backgroundColor = UIColor(named: "cl_quart_3")
        case 3:
            cardView.backgroundColor = UIColor(named: "cl_quart_4")
        default:
            break
        }
        
        listOfMP = HomeViewController.returnSeasonByName(fileName: String(UserDefaults.standard.integer(forKey: "activeSelectRowTrane2") + 1) + "s")
        arrayOfNumbers = returnRandomArray()
        nextArrayOfNumbers = arrayOfNumbers
        updateState(arrayOfNumbers[indexArrayNow])
    }
    
    @IBAction func tapOnCard(_ sender: UITapGestureRecognizer) {
        if showMode == "link" {
            showMode = "verse"
            textVerse.text = strVerse
            textLink.text = ""
            btnNo.isHidden = false
            btnYes.isHidden = false
        } else {
            showMode = "link"
            textVerse.text = ""
            textLink.text = strLink
        }
    }
    
    @IBAction func tapOnNo(_ sender: UIButton) {
        indexArrayNow = indexArrayNow + 1
        if indexArrayNow < numOfElems {
            updateState(arrayOfNumbers[indexArrayNow])
        } else {
            indexArrayNow = 0
            arrayOfNumbers = nextArrayOfNumbers
            numOfElems = newNumOfElems
            updateState(arrayOfNumbers[indexArrayNow])
        }
    }
    
    @IBAction func tapOnYes(_ sender: UIButton) {
        indexArrayNow = indexArrayNow + 1
        newNumOfElems = newNumOfElems - 1
        if indexArrayNow < numOfElems {
            for (i, item) in nextArrayOfNumbers.enumerated() {
                if arrayOfNumbers[indexArrayNow-1] == item {
                    nextArrayOfNumbers.remove(at: i)
                }
            }
            updateState(arrayOfNumbers[indexArrayNow])
        } else {
            if newNumOfElems == 0 {
                let alert = UIAlertController(title: "Финиш", message: "Поздравляем, тренировка окончена! Вы рассказали правильно все стихи. Можете пройти ее еще раз или проверить свои знания.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Закрыть", style: .destructive, handler: clickOnClose))
                present(alert, animated: true)
            } else {
                indexArrayNow = 0
                arrayOfNumbers = nextArrayOfNumbers
                numOfElems = newNumOfElems
                updateState(arrayOfNumbers[indexArrayNow])
            }
        }
    }
    
    func clickOnClose(alert: UIAlertAction!) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateState(_ verse: Int) {
        for (index, it) in (listOfMP?.enumerated())! {
            if String(index + 1) + "q" == String(UserDefaults.standard.integer(forKey: "activeSelectRowTrane1") + 1) + "q" {
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
                        
                        strLink = verses?["link_small"]!
                        
                        textLink.text = strLink
                        textVerse.text = ""
                        showMode = "link"
                        btnNo.isHidden = true
                        btnYes.isHidden = true
                    }
                }
            }
        }
    }
    
    func returnRandomArray() -> [Int] {
        var isContinue = true
        var arr: [Int] = Array()
        while isContinue {
            if arr.count < 12 {
                let number = Int.random(in: 0 ..< 12)
                if !arr.contains(number) {
                    arr.append(number)
                }
            } else {
                isContinue = false
            }
        }
        return arr
    }
    
}
