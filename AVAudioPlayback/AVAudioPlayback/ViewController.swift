//
//  ViewController.swift
//  AVAudioPlayback
//
//  Created by Siddhant Pagariya on 10/3/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var url = NSURL()
    var audioplayer:AVAudioPlayer?
    @IBAction func playSound(sender: AnyObject) {
        url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ButtonTap", ofType: "mp3")!)
        try? audioplayer = AVAudioPlayer(contentsOfURL: url)
        audioplayer?.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

