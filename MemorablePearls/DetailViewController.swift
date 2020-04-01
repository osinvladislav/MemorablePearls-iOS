//
//  DetailViewController.swift
//  MemorablePearls
//
//  Created by Vladislav Osin on 19.03.2020.
//  Copyright © 2020 Splash studio. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleText: UINavigationItem!
    @IBOutlet weak var textDate: UILabel!
    @IBOutlet weak var textVerse: UILabel!
    @IBOutlet weak var textLink: UILabel!
    var mp: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        titleText.title = UserDefaults.standard.string(forKey: "verseLinkShort")
        
        textDate.text = UserDefaults.standard.string(forKey: "verseDate")
        textVerse.text = UserDefaults.standard.string(forKey: "verseText")
        textLink.text = UserDefaults.standard.string(forKey: "verseLinkLong")
    }

    @IBAction func clickItemCopy(_ sender: UIBarButtonItem) {
        UIPasteboard.general.string = textVerse.text! + " " + UserDefaults.standard.string(forKey: "verseLinkShort")!
        let alert = UIAlertController(title: "Скопировано в буфер обмена!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func clickItemListen(_ sender: UIBarButtonItem) {
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


