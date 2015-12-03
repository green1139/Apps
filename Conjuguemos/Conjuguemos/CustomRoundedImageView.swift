//
//  CustomRoundedImageView.swift
//  Conjuguemos
//
//  Created by Siddhant Pagariya on 10/23/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

@IBDesignable class CustomRoundedImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var cornerRadius:CGFloat = 0
    {
        didSet
        {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
