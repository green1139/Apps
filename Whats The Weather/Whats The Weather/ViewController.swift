//
//  ViewController.swift
//  Whats The Weather
//
//  Created by Siddhant Pagariya on 6/23/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var city: UITextField!
    
    func showError()
    {
        weather.text = "Was not able to find weather for " + city.text! + ". Please try again."
    }
    
    @IBAction func findWeather(sender: AnyObject) {
        self.weather.text = ""
        let City = city.text
        let url = NSURL(string: "http://www.weather-forecast.com/locations/" + (City?.stringByReplacingOccurrencesOfString(" ", withString: "-"))! + "/forecasts/latest")
        
        if url != nil {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                var urlError = false
                var weatherString = ""
                
                if error == nil {
                    let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString!
                    var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">")
                    if urlContentArray.count > 1
                    {
                        let weatherArray = urlContentArray[1].componentsSeparatedByString("</span>")
                        weatherString = weatherArray[0]
                        weatherString = weatherString.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                    }
                    else
                    {
                        urlError = true
                    }
                }
                else {
                    urlError = true
                }
                dispatch_async(dispatch_get_main_queue()) {
                    if urlError == true
                    {
                        self.showError()
                    }
                    else
                    {
                        self.weather.text = weatherString
                    }
                }
            })
            task.resume()
        }
        else
        {
            showError()
        }

    }
    
    @IBOutlet weak var weather: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        weather.text = ""
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.findWeather(self)
        textField.resignFirstResponder()
        return true
    }
}

