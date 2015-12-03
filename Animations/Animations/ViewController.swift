//
//  ViewController.swift
//  Animations
//
//  Created by Siddhant Pagariya on 6/25/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var frameNumber = 1
    var timer = NSTimer()
    var imageWidth = 0, imageHeight = 0, x = 0, y = 0
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func updateImage(sender: AnyObject) {
        if (timer.valid)
        {
            timer.invalidate()
        }
        else
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        frameNumber = 1
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
    }

    func doAnimation()
    {
        if (frameNumber == 9)
        {
            frameNumber = 1
        }
        else
        {
            frameNumber++
        }
        imageView.image = UIImage(named: "frame\(frameNumber)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        ///imageView.center = CGPointMake(imageView.center.x-400, imageView.center.y)
        ///imageView.alpha = 0
        imageWidth = Int(imageView.frame.width)
        imageHeight = Int(imageView.frame.height)
        x = Int(imageView.frame.minX)
        y = Int(imageView.frame.minY)
        imageView.frame = CGRectMake(CGFloat(x), CGFloat(y), 0, 0)
    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { () -> Void in
            ///self.imageView.center = CGPointMake(self.imageView.center.x+400, self.imageView.center.y)
            ///self.imageView.alpha = 1
            self.imageView.frame = CGRectMake(CGFloat(self.x), CGFloat(self.y), CGFloat(self.imageWidth), CGFloat(self.imageHeight))
        }
    }
}

