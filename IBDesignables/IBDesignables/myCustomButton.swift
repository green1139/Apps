//
//  myCustomButton.swift
//  IBDesignables
//
//  Created by Siddhant Pagariya on 10/8/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

@IBDesignable class myCustomButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    @IBInspectable var cornerRadius:CGFloat = 0
    {
            didSet {
                layer.cornerRadius = cornerRadius
            }
    }
    @IBInspectable var customBackgroundColor:UIColor = UIColor.clearColor()
    {
        didSet {
            layer.backgroundColor = customBackgroundColor.CGColor
        }
    }
}
