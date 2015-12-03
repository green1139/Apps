//
//  ViewController.swift
//  Segue and dismiss View Controller
//
//  Created by Siddhant Pagariya on 8/31/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var elCapImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        let theEffectsView = UIVisualEffectView(effect: vibrancyEffect) as UIVisualEffectView
        theEffectsView.frame = self.view.bounds
        theEffectsView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        elCapImageView.addSubview(theEffectsView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "go")
        {
            print("getting the GO segue")
        }
        else
        {
            print("getting the \(segue.identifier)  segue")
        }
    }
}

