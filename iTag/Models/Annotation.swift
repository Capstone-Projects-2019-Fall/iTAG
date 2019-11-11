//
//  Annotation.swift
//  iTag
//
//  Created by Leo Vergnetti on 11/2/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

class Annotation : Codable{
    let start : Int
    let end : Int
    let text : String
    var label: String
    
    init(range : NSRange, text: String, label: String){
        self.label = label
        self.start = range.lowerBound
        self.end = range.length + start
        self.text = text
    }
    
    func changeLabelName(newLabelName: String){
        self.label = newLabelName
    }
}

