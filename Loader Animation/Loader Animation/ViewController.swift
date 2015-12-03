//
//  ViewController.swift
//  Loader Animation
//
//  Created by Siddhant Pagariya on 7/27/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = NSTimer()
    var frameNumber = 1
    @IBOutlet weak var loaderImage: UIImageView!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        frameNumber = 1
        slider.value = 0.01
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        doAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func speedChanged(sender: AnyObject) {
        if (timer.valid)
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(slider.value), target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        }
        else
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(slider.value), target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        }
        
    }
    func doAnimation()
    {
        if (frameNumber == 11)
        {
            frameNumber = 1
        }
        else
        {
            frameNumber++
        }
        loaderImage.image = UIImage(named: "loader-\(frameNumber)")
    }
}

