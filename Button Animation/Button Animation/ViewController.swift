//
//  ViewController.swift
//  Button Animation
//
//  Created by Siddhant Pagariya on 6/26/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var button: UIButton!
    @IBAction func buttonClicked(sender: AnyObject)
    {
        //SHORTCODE: buttonClicked
        button.transform = CGAffineTransformMakeScale(1.5, 1.5)
        UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.button.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    override func viewDidAppear(animated: Bool) {
        button.transform = CGAffineTransformMakeScale(0.1, 0.1)
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.button.transform = CGAffineTransformIdentity
            }, completion: nil)
        
    }
}

