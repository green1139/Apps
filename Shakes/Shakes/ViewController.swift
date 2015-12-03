//
//  ViewController.swift
//  Shakes
//
//  Created by Siddhant Pagariya on 7/29/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shakes = 0
    @IBOutlet weak var shakesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if (motion == UIEventSubtype.MotionShake)
        {
            shakes++
            print("shake: \(shakes)")
            shakesLabel.text = "Shakes: \(shakes)"
        }
    }

}

