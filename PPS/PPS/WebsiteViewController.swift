//
//  FirstViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/13/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import WebKit

var websiteURL = NSURL(string: "https://www.portageps.org")
var websiteTitle = "Website"
class WebsiteViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var WebView: UIWebView!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBAction func backAction(sender: AnyObject) {
        WebView.goBack()
    }
    @IBAction func forwardAction(sender: AnyObject) {
        WebView.goForward()
    }
    @IBAction func reloadPage(sender: AnyObject) {
        WebView.reload()
    }
    /*override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let url = NSURL(string: "http://www.portageps.org")
    let request = NSURLRequest(URL: url!)
    self.WebView.loadRequest(request)
    WebView.canGoBack
    WebView.canGoForward
    }*/
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ///let url = NSURL(string: "http://www.portageps.org")
        let request = NSURLRequest(URL: websiteURL!)
        self.WebView.loadRequest(request)
        WebView.canGoBack
        WebView.canGoForward
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?)
    {
        if (error != nil && error!.code == -1009)
        {
            let alertController = UIAlertController(title: "No internet connection", message: "Please check your internet connection.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        /**else
        {
        let alertView = UIAlertView(title: "No internet connection", message: "Please check you internet connection.", delegate: self, cancelButtonTitle: "Ok")
        alertView.show()
        }**/
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        self.navigationItem.title = websiteTitle
    }
}