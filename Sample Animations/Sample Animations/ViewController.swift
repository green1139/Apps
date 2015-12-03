//
//  ViewController.swift
//  Sample Animations
//
//  Created by Siddhant Pagariya on 6/28/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidAppear(animated: Bool) {
        if (message != "")
        {
            label.text = message
        }
        else
        {
            label.text = "No message!"
        }
    }
}

