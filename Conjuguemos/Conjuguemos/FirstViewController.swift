//
//  FirstViewController.swift
//  Conjuguemos
//
//  Created by Siddhant Pagariya on 9/29/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import MaterialKit
import SCLAlertView
import SafariServices

class FirstViewController: UIViewController, UIWebViewDelegate, SFSafariViewControllerDelegate {
    var highScore = 0.0
    var timer = NSTimer()
    ///var Error = true
    ///var AlertMessage = ""
    @IBOutlet weak var webView: UIWebView!
    @IBAction func backButtonAction(sender: AnyObject)
    {
        webView.goBack()
    }
    @IBAction func forwardButtonAction(sender: AnyObject) {
        webView.goForward()
    }
    @IBAction func goHome(sender: AnyObject) {
        let url = NSBundle.mainBundle().URLForResource("vocab\(languageToLearn)", withExtension:"html")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    override func viewDidAppear(animated: Bool)
    {
        webView.delegate = self
        let url = NSBundle.mainBundle().URLForResource("vocab\(languageToLearn)", withExtension:"html")
        if (NSUserDefaults.standardUserDefaults().objectForKey("vocabHighScore") == nil)
        {
            NSUserDefaults.standardUserDefaults().setObject(highScore, forKey: "vocabHighScore")
            self.navigationController?.tabBarItem.badgeValue = "\(highScore)%"
        }
        else
        {
            highScore = NSUserDefaults.standardUserDefaults().objectForKey("vocabHighScore") as! Double
            self.navigationController?.tabBarItem.badgeValue = "\(highScore)%"
        }
        if (NSUserDefaults.standardUserDefaults().objectForKey("scoresList") == nil)
        {
            NSUserDefaults.standardUserDefaults().setObject(scores, forKey: "scoresList")
        }
        else
        {
            scores = NSUserDefaults.standardUserDefaults().objectForKey("scoresList") as! [[String:String]]
        }
        
        if (url != nil)
        {
            let request = NSURLRequest(URL: url!)
            webView.loadRequest(request)
        }
        self.navigationController?.hidesBarsWhenKeyboardAppears = true
        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationController?.hidesBarsWhenVerticallyCompact = true
        timer  = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "check", userInfo: nil, repeats: true)
        (self.navigationController!.tabBarController!.tabBar.items!)[2].badgeValue = nil
        (self.navigationController!.tabBarController!.tabBar.items!)[3].badgeValue = nil
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if (navigationType == UIWebViewNavigationType.LinkClicked)
        {
            webView.loadRequest(request)
        }
        return true
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("\(error!)\n")
        ///Error = true
        ///AlertMessage = "Check Internet Connection."
        ///performSegueWithIdentifier("vocabAlert", sender: self)
        if (error?.code == -1009)
        {
            SCLAlertView().showTitle("Check Your Internet.", subTitle: "See if your device is online", style: SCLAlertViewStyle.Error, duration: 0.0, colorStyle: 0xC1272D, showTheCloseButton: true)
        }
        else
        {
            SCLAlertView().showTitle("Error!", subTitle: "Could not load page. Please Contact Support.", style: SCLAlertViewStyle.Warning, duration: 0.0, colorStyle: 0xFFD110, showTheCloseButton: true)
        }
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        if (webView.loading)
        {
            return;
        }
        ///Error = false
        ///AlertMessage = "Page Loaded."
        ///performSegueWithIdentifier("vocabAlert", sender: self)
        SCLAlertView().showTitle("Page Loaded.", subTitle: "The Page was loaded successfully", style: SCLAlertViewStyle.Success, duration: 0.5, colorStyle: 0x22B573, showTheCloseButton: false)
        timer.invalidate()
        timer  = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "check", userInfo: nil, repeats: true)
        check()
    }
    func check()
    {
        let data = webView.stringByEvaluatingJavaScriptFromString("clock")
        var title:String! = webView.stringByEvaluatingJavaScriptFromString("document.title")
        title = ((title!.componentsSeparatedByString(" | "))[0])
        if let data = data {
            if (data == "0")
            {
                let data2 = webView.stringByEvaluatingJavaScriptFromString("correct")
                let data3 = webView.stringByEvaluatingJavaScriptFromString("attempted")!
                if let data2 = data2{
                    if (data2 != "" && data3 != "" && data3 != "0")
                    {
                        addNewScoreEntry("Vocabulary (\(languageToLearn))", title: title, score: data2+"/"+data3)
                        if ((Double(data2)! / Double(data3)!)*100 > highScore)
                        {
                            highScore = round((Double(data2)! / Double(data3)!)*10000)/100
                            NSUserDefaults.standardUserDefaults().setObject(highScore, forKey: "vocabHighScore")
                            self.navigationController?.tabBarItem.badgeValue = "\(highScore)%"
                            ///AlertMessage = "New High score: \(highScore)%"
                            ///Error = false
                            ///performSegueWithIdentifier("vocabAlert", sender: self)
                            SCLAlertView().showTitle("New High score!", subTitle: "\(highScore)%", style: SCLAlertViewStyle.Info, duration: 0.0, colorStyle: 0x22B573, showTheCloseButton: true)
                            
                        }
                        timer.invalidate()
                        webView.reload()
                    }
                }
            }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        timer.invalidate()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /**if (segue.identifier == "vocabAlert")
        {
        let vc = segue.destinationViewController as! PopUpViewController
        if (!Error)
        {
        vc.error = false
        }
        else
        {
        vc.error = true
        }
        vc.message = AlertMessage
        }**/
    }
}