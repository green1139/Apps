//
//  ViewController.swift
//  Blur Effect
//
//  Created by Siddhant Pagariya on 9/1/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ElCapImageView: UIImageView!
    @IBOutlet weak var theTextView: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    var timer = NSTimer()
    var index = 0
    let WelcomeString = "This is the Portage Public Schools App. You will be shown a brief tutorial of how to use the app."
    var animationDone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        /*while
        {
        
        }*/
        //timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("addLetter"), userInfo: nil, repeats: true)
    }

    func addLetter()
    {
        if (secondLabel.text != WelcomeString)
        {
            //let startIndex = advance(WelcomeString.startIndex, index)
            let endIndex = WelcomeString.startIndex.advancedBy(index+1)
            //let range = startIndex...endIndex
            //secondLabel.text = WelcomeString.substringWithRange(range)
            secondLabel.text = WelcomeString.substringToIndex(endIndex)
            index++
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
    
    override func viewWillLayoutSubviews() {
        if (!animationDone)
        {
            animationDone = true
            
            theTextView.alpha = 0
            let oldCenter = theTextView.center
            theTextView.center.y = theTextView.center.y + self.view.center.y + self.view.center.y + theTextView.center.y
            UIView.animateWithDuration(6, delay: 0.4, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.theTextView.alpha = 1
            self.theTextView.center = oldCenter
                }, completion: { (bool) -> Void in
                    self.viewWillLayoutSubviews()
            })
        }
        else if (!timer.valid)
        {
            startTimer()
        }
    }
    func startTimer()
    {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("addLetter"), userInfo: nil, repeats: true)
    }
}

