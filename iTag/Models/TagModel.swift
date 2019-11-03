//
//  TagModel.swift
//  iTag
//
//  Created by Leo Vergnetti on 11/2/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

class TagModel {
    var openDocuments : [Document]
    var currentDocument : Document?
    var categories : [String]
    
    init(){
        let document = Document()
        self.openDocuments = [document]
        self.currentDocument = document
        self.categories = ["Label"]
    }
    
    func addAnnotation(range: NSRange) -> Bool{
        if range.length != 0, let document = currentDocument {
            document.addAnnotation(range: range)
        }
        return range.length != 0
        
    }
    
    func getCurrentDocumentText() -> String? {
        return currentDocument?.content
    }
    
    func getCurrentDocumentTitle() -> String? {
        return currentDocument?.title
    }
    
    func getAnnotationRangesForCurrentDocument() -> [NSRange]?{
        return currentDocument?.annotations.map{ $0.range }
    }
    
    func getCurrentDocumentAsJSONObject() -> String{
        return "JSON DOOD"
    }
}
