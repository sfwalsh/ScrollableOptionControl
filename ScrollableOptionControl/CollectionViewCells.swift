//
//  CollectionViewCells.swift
//  ScrollableOptionControl
//
//  Created by Stephen Walsh on 27/09/2015.
//  Copyright (c) 2015 Stephen Walsh. All rights reserved.
//

import UIKit

private struct DefaultValues {
    static let defaultDisplayName = "X"
}

class TextOptionCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var option: Option? {
        didSet{
            self.updateTextLabel()
        }
    }

    override var selected: Bool {
        didSet {
            if self.selected {
                self.textLabel.textColor = UIColor.whiteColor()
            }else {
                self.textLabel.textColor = UIColor.deselectedOptionColour()
            }
        }
    }
    
    
    //MARK: Actions
    func setupCellWithSelectableOption(option: Option) {
        self.option = option
    }
    
    private func updateTextLabel() {
        
        if let option = self.option {
            
            switch option {
            case .Text(let name, let shortDisplayName, let longDisplayName):
                self.textLabel.text = shortDisplayName ?? DefaultValues.defaultDisplayName
                break
            default:
                break
            }
        }
        
    }
}

class ColorOptionCell: UICollectionViewCell {
    
    @IBOutlet weak var colourView: BorderedCircularView!
    
    var option: Option? {
        didSet{
            self.updateColour()
        }
    }
    
    override var selected: Bool {
        didSet {
            if self.selected {
                self.colourView.borderColour = UIColor.borderColour()
            }else {
                self.colourView.borderColour = UIColor.deselectedBorderColour()
            }
        }
    }
    
    
    //MARK: Actions
    func setupCellWithSelectableOption(option: Option) {
        self.option = option
    }
    
    private func updateColour() {
        
        if let option = self.option {
            
            switch option {
            case .Colour(let name, let colour, let longDisplayName):
                self.colourView.backgroundColor = colour
                break
            default:
                break
            }
        }
        
    }
}


class BlankOptionCell: UICollectionViewCell {
    //Don't need to do anything
}
