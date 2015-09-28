//
//  CustomViews.swift
//  ScrollableOptionControl
//
//  Created by Stephen Walsh on 28/09/2015.
//  Copyright (c) 2015 Stephen Walsh. All rights reserved.
//

import UIKit

class CircularView: UIView {
    
    private func applyCircleMask() {
        let circleMask = CAShapeLayer()
        circleMask.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.frame.size.height/2).CGPath
        circleMask.fillColor = UIColor.blackColor().CGColor
        
        self.layer.mask = circleMask
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.applyCircleMask()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.applyCircleMask()
    }
}

@IBDesignable class BorderedCircularView: CircularView {
    
    private struct DefaultValues {
        static let defaultBorderWidth: CGFloat = 4.0
        static let defaultBorderColour = UIColor.deselectedBorderColour()
    }
    
    @IBInspectable var borderWidth: CGFloat = DefaultValues.defaultBorderWidth
    @IBInspectable var borderColour: UIColor = DefaultValues.defaultBorderColour {didSet{self.updateBorderLayerStrokeColour()}}
    
    var borderLayer = CAShapeLayer()
    
    private func applyBorder() {
        self.borderLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.frame.size.height/2).CGPath
        self.borderLayer.fillColor = UIColor.clearColor().CGColor
        self.borderLayer.strokeColor = self.borderColour.CGColor
        self.borderLayer.lineWidth = self.borderWidth
        
        self.layer.addSublayer(borderLayer)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.applyBorder()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.applyBorder()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = CGRectInset(self.frame, -self.borderWidth, -self.borderWidth)
    }
    
    func updateBorderLayerStrokeColour() {
        self.borderLayer.strokeColor = self.borderColour.CGColor
    }
}


