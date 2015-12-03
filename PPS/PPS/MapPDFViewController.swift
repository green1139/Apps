//
//  MapPDFViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 7/3/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class MapPDFViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        let path = NSBundle.mainBundle().pathForResource(selectedSchool, ofType: "pdf")!
        let url = NSURL(fileURLWithPath: path)
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
}
