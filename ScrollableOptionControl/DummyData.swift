//
//  DummyData.swift
//  ScrollableOptionControl
//
//  Created by Stephen Walsh on 28/09/2015.
//  Copyright (c) 2015 Stephen Walsh. All rights reserved.
//

import UIKit

struct DummyData {
    static let colourDatasource = [
        Option.Blank(placeholderValue: "None"),
        Option.Colour(name: "goldenYellow", colour: UIColor.goldenYellow(), longDisplayName: "Golden Yellow"),
        Option.Colour(name: "goldenOrange", colour: UIColor.goldenOrange(), longDisplayName: "Golden Orange"),
        Option.Colour(name: "skyblue", colour: UIColor.skyBlue(), longDisplayName: "Sky Blue")]
    
    static let sizeDatasource = [
        Option.Blank(placeholderValue: "None"),
        Option.Text(name: "petite", shortDisplayName: "P", longDisplayName: "Petite"),
        Option.Text(name: "extraextrasmall", shortDisplayName: "XXS", longDisplayName: "Extra Extra Small"),
        Option.Text(name: "extrasmall", shortDisplayName: "XS", longDisplayName: "Extra Small"),
        Option.Text(name: "small", shortDisplayName: "S", longDisplayName: "Small"),
        Option.Text(name: "medium", shortDisplayName: "M", longDisplayName: "Medium"),
        Option.Text(name: "extramedium", shortDisplayName: "XM", longDisplayName: "Extra Medium"),
        Option.Text(name: "large", shortDisplayName: "L", longDisplayName: "Large"),
        Option.Text(name: "extralarge", shortDisplayName: "XL", longDisplayName: "Extra Large"),
        Option.Text(name: "extraextralarge", shortDisplayName: "XXL", longDisplayName: "Extra Extra Large"),
        Option.Text(name: "reallylarge", shortDisplayName: "RL", longDisplayName: "Really Large"),
        Option.Text(name: "supersize", shortDisplayName: "SXL", longDisplayName: "Supersize"),
        Option.Text(name: "trulyverylargeindeed", shortDisplayName: "TVLI", longDisplayName: "Truly Very Large Indeed")]
    
    static let quantityDatasource = [
        Option.Blank(placeholderValue: "None"),
        Option.Text(name: "1", shortDisplayName: "1", longDisplayName: "1"),
        Option.Text(name: "2", shortDisplayName: "2", longDisplayName: "2"),
        Option.Text(name: "3", shortDisplayName: "3", longDisplayName: "3"),
        Option.Text(name: "4", shortDisplayName: "4", longDisplayName: "4"),
        Option.Text(name: "5", shortDisplayName: "5", longDisplayName: "5")]
}