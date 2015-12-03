//
//  ScoreViewController.swift
//  Conjuguemos
//
//  Created by Siddhant Pagariya on 9/30/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import SCLAlertView
import GoogleMobileAds

var languageToLearn = "Spanish"
var showAds = 0;

func welcomeScreenPresent(sender: UIViewController)
{
    let welcomeView = SCLAlertView()
    welcomeView.shouldAutorotate()
    welcomeView.addButton("Spanish", action: { () -> Void in
        ///print("Spanish selected")
        //self.tabBarController?.tabBar.items![4].enabled = true
        if (sender.tabBarController?.viewControllers!.count != 5)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("GrammarNav") as UIViewController
            sender.tabBarController!.viewControllers?.insert(vc, atIndex: 3)
        }
        NSUserDefaults.standardUserDefaults().setObject("Spanish", forKey: "language")
        languageToLearn = "Spanish"
    })
    welcomeView.addButton("French", action: { () -> Void in
        ///print("French selected")
        if (sender.tabBarController?.viewControllers!.count != 5)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("GrammarNav") as UIViewController
            sender.tabBarController!.viewControllers?.insert(vc, atIndex: 3)
        }
        NSUserDefaults.standardUserDefaults().setObject("French", forKey: "language")
        languageToLearn = "French"
    })
    welcomeView.addButton("Latin", action: { () -> Void in
        ///print("Latin selected")
        if (sender.tabBarController?.viewControllers!.count == 5)
        {
            sender.tabBarController?.viewControllers?.removeAtIndex(3)
        }
        NSUserDefaults.standardUserDefaults().setObject("Latin", forKey: "language")
        languageToLearn = "Latin"
    })
    welcomeView.addButton("German", action: { () -> Void in
        ///print("German selected")
        if (sender.tabBarController?.viewControllers!.count == 5)
        {
            sender.tabBarController?.viewControllers?.removeAtIndex(3)
        }
        NSUserDefaults.standardUserDefaults().setObject("German", forKey: "language")
        languageToLearn = "German"
    })
    welcomeView.addButton("Portuguese", action: { () -> Void in
        ///print("Portugese selected")
        if (sender.tabBarController?.viewControllers!.count == 5)
        {
            sender.tabBarController?.viewControllers?.removeAtIndex(3)
        }
        NSUserDefaults.standardUserDefaults().setObject("Portuguese", forKey: "language")
        languageToLearn = "Portuguese"
    })
    welcomeView.addButton("Italian", action: { () -> Void in
        ///print("Italian selected")
        if (sender.tabBarController?.viewControllers!.count == 5)
        {
            sender.tabBarController?.viewControllers?.removeAtIndex(3)
        }
        NSUserDefaults.standardUserDefaults().setObject("Italian", forKey: "language")
        languageToLearn = "Italian"
    })
    welcomeView.showTitle("Welcome!", subTitle: "Please select a language to learn.", style: SCLAlertViewStyle.Notice, duration: 0.0, colorStyle: 0x379CFF, showTheCloseButton: false)
}

class ScoreViewController: UIViewController, GADInterstitialDelegate {
    
    var interstitial:GADInterstitial?
    @IBOutlet weak var vocabScore: UILabel!
    @IBOutlet weak var grammarScore: UILabel!
    @IBOutlet weak var conjugationScore: UILabel!
    @IBOutlet weak var bottomBannerView: DFPBannerView!
    @IBAction func showAd(sender: AnyObject) {
        showInterstitial()
    }
    override func viewDidLoad() {
        loadInterstitial()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        (self.navigationController!.tabBarController!.tabBar.items!)[1].badgeValue = nil
        (self.navigationController!.tabBarController!.tabBar.items!)[2].badgeValue = nil
        (self.navigationController!.tabBarController!.tabBar.items!)[3].badgeValue = nil
        
        //self.performSegueWithIdentifier("Loader", sender: self)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        ///self.performSegueWithIdentifier("Loader", sender: self)
        SCLAlertView().showTitle("Scores Loaded.", subTitle: "Scores were loaded successfully", style: SCLAlertViewStyle.Success, duration: 0.5, colorStyle: 0x22B573, showTheCloseButton: false)
        if let _ = NSUserDefaults.standardUserDefaults().objectForKey("language")
        {
            //print("Learning \(languageToLearn), same as \(language as! String)\n")
            ///NSUserDefaults.standardUserDefaults().removeObjectForKey("language")
            //self.performSelector(Selector("loadBanner"), withObject: self, afterDelay: 2.0)
            loadBanner()
            if (showAds == 0)
            {
                self.performSelector(Selector("showInterstitial"), withObject: self, afterDelay: 1.5)
            }
            else
            {
                showInterstitial()
            }
        }
        else
        {
            if (self.tabBarController?.viewControllers!.count != 5)
            {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("GrammarNav") as UIViewController
                self.tabBarController!.viewControllers?.insert(vc, atIndex: 3)
            }
            welcomeScreenPresent(self)
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("vocabHighScore") != nil)
        {
            let score = NSUserDefaults.standardUserDefaults().objectForKey("vocabHighScore") as! Double
            vocabScore.text = "\(score)%"
        }
        else
        {
            vocabScore.text = "0.0%"
        }
        if (NSUserDefaults.standardUserDefaults().objectForKey("grammarHighScore") != nil)
        {
            let score = NSUserDefaults.standardUserDefaults().objectForKey("grammarHighScore") as! Double
            grammarScore.text = "\(score)%"
        }
        else
        {
            grammarScore.text = "0.0%"
        }
        if (NSUserDefaults.standardUserDefaults().objectForKey("conjugationsHighScore") != nil)
        {
            let score = NSUserDefaults.standardUserDefaults().objectForKey("conjugationsHighScore") as! Double
            conjugationScore.text = "\(score)%"
        }
        else
        {
            conjugationScore.text = "0.0%"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadBanner()
    {
        bottomBannerView.adUnitID = "ca-app-pub-3333820692385997/3822100264"
        bottomBannerView.rootViewController = self
        let request = DFPRequest()
        request.testDevices = [kGADSimulatorID]
        ///request.testDevices.append("0e0b421f2dfe644b699015c5780cf4dc")
        ///request.testDevices.append("24b6be934f2ea473a73cd481711aee02")
        bottomBannerView.loadRequest(request)
    }
    
    private func loadInterstitial() {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3333820692385997/5298833462")
        interstitial!.delegate = self
        
        // Request test ads on devices you specify. Your test device ID is printed to the console when
        // an ad request is made. GADInterstitial automatically returns test ads when running on a
        // simulator.
        let request = GADRequest()
        // Requests test ads on test devices.
        request.testDevices = [kGADSimulatorID]
        ///request.testDevices.append("0e0b421f2dfe644b699015c5780cf4dc")
        ///request.testDevices.append("24b6be934f2ea473a73cd481711aee02")
        interstitial!.loadRequest(request)
    }
    
    
    func interstitialDidFailToReceiveAdWithError (
        interstitial: GADInterstitial,
        error: GADRequestError) {
            print("interstitialDidFailToReceiveAdWithError: %@" + error.localizedDescription)
    }
    
    func interstitialDidDismissScreen (interstitial: GADInterstitial) {
        ///print("interstitialDidDismissScreen")
        loadInterstitial()
        loadBanner()
    }
    
    func showInterstitial()
    {
        print("Try #\(showAds) for Ads")
        if (showAds%3 == 0)
        {
            if (interstitial!.isReady)
            {
                interstitial!.presentFromRootViewController(self)
                showAds++;
            }
            else
            {
                print("Interstitial not ready.")
            }
        }
        else
        {
            showAds++;
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        /**if segue.identifier == "Loader" {
        let viewController:PopUpViewController = segue.destinationViewController as! PopUpViewController
        viewController.error = false
        viewController.message = "Scores Loaded."
        }**/
    }
}
