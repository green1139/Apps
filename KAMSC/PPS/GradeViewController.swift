//
//  FirstViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/13/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import WebKit

class GradeViewController: UIViewController, UIWebViewDelegate, WKUIDelegate {
    
    @IBOutlet weak var WebView: UIWebView!
    @IBAction func backAction(sender: AnyObject) {
        WebView.goBack()
    }
    @IBAction func forwardAction(sender: AnyObject) {
        WebView.goForward()
    }
   /*override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://skyward.portageps.org")
        //self.navigationController?.popToRootViewControllerAnimated(true)
        UIApplication.sharedApplication().openURL(url!)
    }*/
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let url = NSURL(string: "https://skyward.portageps.org")
        //self.navigationController?.popToRootViewControllerAnimated(true)
        UIApplication.sharedApplication().openURL(url!)
    }
    /*@IBAction func change(sender: AnyObject) {
        //let script = String("\let a = document.getElementsByTagName(\"a"); for (var i=0; i; a[i].target = "_self"")
        let scr = "var l = document.getElementsByTagName(\"a\"); for (var i=0; i<l.length; i++){l[i].target='_self';}"
        WebView.stringByEvaluatingJavaScriptFromString(String(scr))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://skyward.portageps.org")
        let request = NSURLRequest(URL: url!)
        self.WebView.loadRequest(request)
        WebView.canGoBack
        WebView.canGoForward
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "https://skyward.portageps.org")
        let request = NSURLRequest(URL: url!)
        self.WebView.loadRequest(request)
        WebView.canGoBack
        WebView.canGoForward
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if (navigationType == UIWebViewNavigationType.LinkClicked) {
            self.WebView.loadRequest(request)
            print("Request Loaded: \(request)")
            return false
        }
        return true
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        if (error != nil && error!.code == -1009)
        {
            if #available(iOS 8.0, *)
            {
                let alertController = UIAlertController(title: "No internet connection", message: "Please check your internet connection.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            else
            {
                let alertView = UIAlertView(title: "No internet connection", message: "Please check you internet connection.", delegate: self, cancelButtonTitle: "Ok")
                alertView.show()
            }
        }
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.LinkClicked {
            //UIApplication.sharedApplication().openURL(request.URL!)
            print(request)
            //WebView.loadRequest(request)
            return false
        }
        return true
    }*/
}