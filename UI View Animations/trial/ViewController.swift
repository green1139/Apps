//
//  ViewController.swift
//  trial
//
//  Created by Siddhant Pagariya on 8/13/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = NSTimer()
    @IBOutlet weak var textDisplay: UIView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBAction func clicked(sender: AnyObject) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progress.progress = 0.0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector("progressAction"), userInfo: nil, repeats: true)
        UIView.animateWithDuration(0.5, delay: 3.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.text.alpha = 0
            }, completion: { (value: Bool) -> Void in
                self.text.text = "Welcome"
                UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                    self.text.alpha = 1.0
                }, completion: nil)
        })
    }

    func progressAction()
    {
        if (progress.progress != 1)
        {
            progress.progress = progress.progress + 0.001
            ///print(progress.progress)
        }
        else
        {
            timer.invalidate()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

