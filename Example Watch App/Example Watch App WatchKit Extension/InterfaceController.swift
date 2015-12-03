//
//  InterfaceController.swift
//  Example Watch App WatchKit Extension
//
//  Created by Siddhant Pagariya on 7/5/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var slider: WKInterfaceSlider!
    @IBOutlet var valueLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        slider.setValue(0)
        valueLabel.setText("Value = 0")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func sliderChanged(value: Float) {
        valueLabel.setText("Value = \(Int(value))")
    }
}
