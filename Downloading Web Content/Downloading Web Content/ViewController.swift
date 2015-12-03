//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Siddhant Pagariya on 6/22/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var WebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://stackoverflow.com")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            if (error == nil)
            {
                let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
                //print(urlContent)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.WebView.loadHTMLString(urlContent as! String, baseURL: nil)
                })
            }
        }
        task?.resume()
    }
}

