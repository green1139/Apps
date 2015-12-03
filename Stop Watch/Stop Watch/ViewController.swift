//
//  ViewController.swift
//  Stop Watch
//
//  Created by Siddhant Pagariya on 6/10/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Timer = NSTimer()
    var count = 0.00
    let myArray = [UIBarButtonSystemItem.Play, UIBarButtonSystemItem.Pause]
    var index = 0
    var hours = 0
    var minutes = 0
    var seconds = 0
    var milliseconds = 0
    
    @IBOutlet weak var startButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var minute: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var millisecond: UILabel!
    
    @IBAction func stop(sender: AnyObject) {
        Timer.invalidate()
        
        hour.text = "00"
        minute.text = "00"
        second.text = "00"
        millisecond.text = "                  00"
        hours = 0
        minutes = 0
        seconds = 0
        milliseconds = 0
        startButton.enabled = true
        pauseButton.enabled = false
        stopButton.enabled = false
    }
    
    @IBAction func start(sender: AnyObject) {
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        startButton.enabled = false
        pauseButton.enabled = true
        stopButton.enabled = true
    }
    @IBAction func pause(sender: AnyObject) {
        Timer.invalidate()
        startButton.enabled = true
        pauseButton.enabled = false
        stopButton.enabled = true
    }
    
    func updateTime()
    {
        if (milliseconds < 100)
        {
            milliseconds++
        }
        else
        {
            milliseconds = 0
            seconds++
        }
        let text = String(format: "%02d", milliseconds)
        millisecond.text = "                  \(text)"
        
        if (seconds == 60)
        {
            seconds = 0
            minutes++
        }
        
        second.text = String(format: "%02d", seconds)
        
        if (minutes == 60)
        {
            minutes = 0
            hours++
        }
        
        minute.text = String(format: "%02d", minutes)
        
        if (hours == 24)
        {
            hours = 0
        }
        
        hour.text = String(format: "%02d", hours)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hour.text = "00"
        minute.text = "00"
        second.text = "00"
        millisecond.text = "                  00"
        startButton.enabled = true
        pauseButton.enabled = false
        stopButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

