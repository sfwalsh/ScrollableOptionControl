//
//  OrderDetailsTableView.swift
//  ScrollableOptionControl
//
//  Created by Stephen Walsh on 28/09/2015.
//  Copyright (c) 2015 Stephen Walsh. All rights reserved.
//

import UIKit

struct SelectableOption {
    let optionName: String?
    let optionDisplayName: String?
    let optionLongerDisplayName: String?
}

enum Option {
    case Blank(placeholderValue: String)
    case Text(name: String, shortDisplayName: String, longDisplayName: String)
    case Colour(name: String, colour: UIColor, longDisplayName: String)
}


class OrderDetailsTableView: UITableViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var sizeOptionsCollectionView: UICollectionView!
    @IBOutlet weak var colourOptionsCollectionView: UICollectionView!
    @IBOutlet weak var quantityOptionsCollectionView: UICollectionView!
    
    @IBOutlet var optionCollectionViews: [UICollectionView]!
    
    lazy var sizeOptionsDatasourceDelegate: OrderDetailsCollectionViewDatasource = {
        return OrderDetailsCollectionViewDatasource(datasource: DummyData.sizeDatasource, scrollViewDelegate: self)
        }()
    
    lazy var colourOptionsDatasourceDelegate: OrderDetailsCollectionViewDatasource = {
        return OrderDetailsCollectionViewDatasource(datasource: DummyData.colourDatasource, scrollViewDelegate: self)
        }()
    
    lazy var quantityOptionsDatasourceDelegate: OrderDetailsCollectionViewDatasource = {
        return OrderDetailsCollectionViewDatasource(datasource: DummyData.quantityDatasource, scrollViewDelegate: self)
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionViewDatasources()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        self.invalidateOptionCollectionViewLayouts()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.scrollToFirstIndexPathInOptionCollectionViews(false)
    }
    
}


//MARK: Actions
extension OrderDetailsTableView {
    
    private func setupCollectionViewDatasources() {
        
        self.sizeOptionsCollectionView.dataSource = self.sizeOptionsDatasourceDelegate
        self.sizeOptionsCollectionView.delegate = self.sizeOptionsDatasourceDelegate
        
        self.colourOptionsCollectionView.dataSource = self.colourOptionsDatasourceDelegate
        self.colourOptionsCollectionView.delegate = self.colourOptionsDatasourceDelegate
        
        self.quantityOptionsCollectionView.dataSource = self.quantityOptionsDatasourceDelegate
        self.quantityOptionsCollectionView.delegate = self.quantityOptionsDatasourceDelegate
    }
    
    private func invalidateOptionCollectionViewLayouts() {
        for optionCollectionView in self.optionCollectionViews {
            optionCollectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    private func scrollToFirstIndexPathInOptionCollectionViews(animated: Bool) {
        for optionCollectionView in self.optionCollectionViews {
            optionCollectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: animated)
        }
    }
    
    
    private func moveScrollViewToSelectedPosition(scrollView: UIScrollView, animated: Bool, scrollPosition: UICollectionViewScrollPosition) {
        if scrollView == self.colourOptionsCollectionView {
            self.selectClosestCellToCenterAnimated(animated, withPosition: scrollPosition, onCollectionView: self.colourOptionsCollectionView)
        }else if scrollView == self.sizeOptionsCollectionView {
            self.selectClosestCellToCenterAnimated(animated, withPosition: scrollPosition, onCollectionView: self.sizeOptionsCollectionView)
        }else {
            self.selectClosestCellToCenterAnimated(animated, withPosition: scrollPosition, onCollectionView: self.quantityOptionsCollectionView)
        }
    }
    
    private func selectClosestCellToCenterAnimated(animated: Bool, withPosition position: UICollectionViewScrollPosition, onCollectionView collectionView: UICollectionView) {
        
        let centerPoint = CGPointMake(collectionView.frame.size.width/2 + collectionView.contentOffset.x, collectionView.frame.size.height/2 + collectionView.contentOffset.y)
        if let indexPathOfCenteredCellInCollectionView = collectionView.indexPathForItemAtPoint(centerPoint) {
            if let cell = collectionView.cellForItemAtIndexPath(indexPathOfCenteredCellInCollectionView) {
                collectionView.selectItemAtIndexPath(indexPathOfCenteredCellInCollectionView, animated: animated, scrollPosition: position)
            }
        }
    }
}


//MARK: UIScrollViewDelegate Implementation
extension OrderDetailsTableView: UIScrollViewDelegate {
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        self.moveScrollViewToSelectedPosition(scrollView, animated: false, scrollPosition: UICollectionViewScrollPosition.None)
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.moveScrollViewToSelectedPosition(scrollView, animated: true, scrollPosition: UICollectionViewScrollPosition.CenteredHorizontally)
    }
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.moveScrollViewToSelectedPosition(scrollView, animated: true, scrollPosition: UICollectionViewScrollPosition.CenteredHorizontally)
    }
}
