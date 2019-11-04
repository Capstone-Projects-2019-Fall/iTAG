//
//  Annotation.swift
//  iTag
//
//  Created by Leo Vergnetti on 11/2/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

struct Annotation : Codable{
    let start : Int
    let end : Int
    let text : String
    
    init(range : NSRange, text: String){
        self.start = range.lowerBound
        self.end = range.length + start
        self.text = text
    }
}

