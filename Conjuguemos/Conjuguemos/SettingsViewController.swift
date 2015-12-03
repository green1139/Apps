//
//  SettingsViewController.swift
//  Conjuguemos
//
//  Created by Siddhant Pagariya on 11/25/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SettingsViewController: UIViewController {
    
    var timer  = NSTimer()
    @IBOutlet weak var bannerView: DFPBannerView!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var pastScoresButton: UIButton!
    @IBAction func pickLanguage(sender: AnyObject) {
        welcomeScreenPresent(self)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "refreshLanguageButtonTitle", userInfo: nil, repeats: true)
    }
    @IBAction func aboutPageButton(sender: AnyObject) {
        performSegueWithIdentifier("presentAboutPage", sender: self)
    }
    override func viewDidLoad() {
        refreshLanguageButtonTitle()
    }
    override func viewDidAppear(animated: Bool) {
        refreshLanguageButtonTitle()
        (self.navigationController!.tabBarController!.tabBar.items!)[1].badgeValue = nil
        (self.navigationController!.tabBarController!.tabBar.items!)[2].badgeValue = nil
        (self.navigationController!.tabBarController!.tabBar.items!)[3].badgeValue = nil
        languageButton.layer.shadowOpacity = 0.7
        languageButton.layer.shadowRadius = 5.0
        languageButton.layer.shadowColor = UIColor.grayColor().CGColor
        languageButton.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        pastScoresButton.layer.shadowOpacity = 0.6
        pastScoresButton.layer.shadowRadius = 10.0
        pastScoresButton.layer.shadowColor = UIColor.blackColor().CGColor
        pastScoresButton.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        loadBanner()
    }
    override func viewDidDisappear(animated: Bool) {
        timer.invalidate()
        self.navigationController!.tabBarItem.title = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func refreshLanguageButtonTitle()
    {
        if (NSUserDefaults.standardUserDefaults().objectForKey("language") != nil)
        {
            languageButton.setTitle((NSUserDefaults.standardUserDefaults().objectForKey("language") as! String), forState: UIControlState.Normal)
            languageButton.setTitle((NSUserDefaults.standardUserDefaults().objectForKey("language") as! String), forState: UIControlState.Highlighted)
            self.navigationController!.tabBarItem.title = NSUserDefaults.standardUserDefaults().objectForKey("language") as? String
        }
    }
    
    func loadBanner()
    {
        bannerView.adUnitID = "ca-app-pub-3333820692385997/9373302664"
        bannerView.rootViewController = self
        let request = DFPRequest()
        request.testDevices = [kGADSimulatorID]
        ///request.testDevices.append("0e0b421f2dfe644b699015c5780cf4dc")
        ///request.testDevices.append("24b6be934f2ea473a73cd481711aee02")
        bannerView.loadRequest(request)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
