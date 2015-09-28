//
//  Colours.swift
//  ScrollableOptionControl
//
//  Created by Stephen Walsh on 27/09/2015.
//  Copyright (c) 2015 Stephen Walsh. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorWithRGB(redValue:CGFloat, greenValue: CGFloat, blueValue: CGFloat, alphaValue: CGFloat) -> UIColor {
        return UIColor(red: redValue/255, green: greenValue/255, blue: blueValue/255, alpha: 1.0)
    }
    
    class func deselectedOptionColour() -> UIColor {
        return UIColor.blackColor().colorWithAlphaComponent(0.20)
    }
    
    class func borderColour() -> UIColor {
        return UIColor.whiteColor()
    }

    class func deselectedBorderColour() -> UIColor {
        return UIColor.clearColor()
    }
    
    class func goldenYellow() -> UIColor {
        return UIColor.colorWithRGB(254, greenValue: 197, blueValue: 10, alphaValue: 1.0)
    }
    
    class func goldenOrange() -> UIColor {
        return UIColor.colorWithRGB(253, greenValue: 152, blueValue: 9, alphaValue: 1.0)
    }

    class func sunsetOrange() -> UIColor {
        return UIColor.colorWithRGB(253, greenValue: 152, blueValue: 9, alphaValue: 1.0)
    }
    
    class func redbrickRed() -> UIColor {
        return UIColor.colorWithRGB(176, greenValue: 37, blueValue: 33, alphaValue: 1.0)
    }
    
    class func modernRed() -> UIColor {
        return UIColor.colorWithRGB(223, greenValue: 52, blueValue: 46, alphaValue: 1.0)
    }
    
    class func cameronPink() -> UIColor {
        return UIColor.colorWithRGB(238, greenValue: 96, blueValue: 182, alphaValue: 1.0)
    }
    
    class func royalMagenta() -> UIColor {
        return UIColor.colorWithRGB(136, greenValue: 64, blueValue: 167, alphaValue: 1.0)
    }

    class func regalPurple() -> UIColor {
        return UIColor.colorWithRGB(96, greenValue: 69, blueValue: 184, alphaValue: 1.0)
    }
    
    class func skyBlue() -> UIColor {
        return UIColor.colorWithRGB(43, greenValue: 132, blueValue: 210, alphaValue: 1.0)
    }
    
    
}
