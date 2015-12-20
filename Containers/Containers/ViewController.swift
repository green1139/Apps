//
//  ViewController.swift
//  Containers
//
//  Created by Siddhant Pagariya on 18 Dec 2015.
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showMenu")
        {
            let vc = segue.destinationViewController
            vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        }
    }
}

