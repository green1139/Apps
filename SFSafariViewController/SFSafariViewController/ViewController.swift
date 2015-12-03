//
//  ViewController.swift
//  SFSafariViewController
//
//  Created by Siddhant Pagariya on 8/29/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBAction func presentSVC(sender: AnyObject) {
        let url = NSURL(string: "http://skyward.portageps.org")
        if (url != nil)
        {
            let SafariVC:SFSafariViewController = SFSafariViewController(URL: url!, entersReaderIfAvailable: true)
            SafariVC.delegate = self
            self.presentViewController(SafariVC, animated: true, completion: nil)
        }
        else
        {
            print("URL not valid.")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

