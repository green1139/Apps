//
//  ViewController.swift
//  WKWebViews
//
//  Created by Siddhant Pagariya on 8/23/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string:"https://www.google.com")
        if (url == nil)
        {
            print("url nil")
        }
        let request = NSURLRequest(URL:url!)
        self.webView!.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        super.loadView()
        let configuration = WKWebViewConfiguration()
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        preferences.javaScriptCanOpenWindowsAutomatically = true
        configuration.preferences = preferences
        self.webView = WKWebView(frame: self.view.bounds, configuration: configuration)
        //self.webView = WKWebView()
        self.view = self.webView
    }
    @IBAction func refresh(sender: AnyObject) {
        let url = NSURL(string: "https://skyward.portageps.org/scripts/wsisa.dll/WService=wsEAplus/seplog01.w")
        if (url == nil)
        {
            print("PPS url nil")
        }
        let request = NSURLRequest(URL: url!)
        self.webView?.loadRequest(request)
    }
    @IBAction func back(sender: AnyObject) {
        self.webView?.goBack()
    }
    @IBAction func forward(sender: AnyObject) {
        self.webView?.goForward()
    }
    /*func webView(webView: WKWebView, createWebViewWithConfiguration configuration: WKWebViewConfiguration, forNavigationAction navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.loadRequest(navigationAction.request)
        }
        return webView
    }*/
}