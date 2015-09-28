//
//  OrderDetailsCollectionViewDatasource.swift
//  ScrollableOptionControl
//
//  Created by Stephen Walsh on 28/09/2015.
//  Copyright (c) 2015 Stephen Walsh. All rights reserved.
//

import UIKit

private struct CellIdentifiers {
    static let textOptionCellIdentifier = "textOptionCell"
    static let blankOptionCellIdentifier = "blankOptionCell"
    static let colorOptionCellIdentifier = "colorOptionCell"
}

class OrderDetailsCollectionViewDatasource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    init(datasource: [Option], scrollViewDelegate: UIScrollViewDelegate) {
        self.datasource = datasource
        self.scrollViewDelegate = scrollViewDelegate
        super.init()
    }
    
    var datasource: [Option]
    @IBOutlet weak var scrollViewDelegate: UIScrollViewDelegate?
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let option = self.datasource[indexPath.row]
        
        switch option {
        case .Text:
            if let textOptionCell = collectionView.dequeueReusableCellWithReuseIdentifier(CellIdentifiers.textOptionCellIdentifier, forIndexPath: indexPath) as? TextOptionCell {
                textOptionCell.setupCellWithSelectableOption(option)
                return textOptionCell
            }
            break
            
        case .Blank:
            if let blankOptionCell = collectionView.dequeueReusableCellWithReuseIdentifier(CellIdentifiers.blankOptionCellIdentifier, forIndexPath: indexPath) as? BlankOptionCell {
                return blankOptionCell
            }
            break
            
        case .Colour:
            if let colourOptionCell = collectionView.dequeueReusableCellWithReuseIdentifier(CellIdentifiers.colorOptionCellIdentifier, forIndexPath: indexPath) as? ColorOptionCell {
                colourOptionCell.setupCellWithSelectableOption(option)
                return colourOptionCell
            }
            break
        default:
            break
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.size.height*2, collectionView.frame.size.height)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, (collectionView.frame.width/2) - collectionView.frame.height/2, 0, (collectionView.frame.width/2) - collectionView.frame.height/2)
    }

}


//MARK: UIScrollViewDelegate implemetation
extension OrderDetailsCollectionViewDatasource {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if let scrollViewDelegate = self.scrollViewDelegate {
            scrollViewDelegate.scrollViewDidScroll!(scrollView)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if let scrollViewDelegate = self.scrollViewDelegate {
            scrollViewDelegate.scrollViewDidEndDecelerating!(scrollView)
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let scrollViewDelegate = self.scrollViewDelegate {
            scrollViewDelegate.scrollViewDidEndDragging!(scrollView, willDecelerate: decelerate)
        }
    }
}

