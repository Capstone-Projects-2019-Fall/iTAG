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
            document.addAnnotation(range: range, label: self.categories[0])
            return true
        }
        return false
    }
    
    func getCurrentDocumentText() -> String? {
        return currentDocument?.content
    }
    
    func changeLabelName(newLabelName: String){
        self.categories = [newLabelName]
        currentDocument?.changeLabelName(newName: newLabelName)
    }
    
    func getCurrentDocumentTitle() -> String? {
        return currentDocument?.title
    }
    
    func getAnnotationRangesForCurrentDocument() -> [NSRange]?{
        return currentDocument?.annotations.map{ NSRange(location: $0.start, length: $0.end - $0.start) }
    }
    
    func getCurrentDocumentAsJSONObject() -> String{
        let data = try! JSONEncoder().encode(currentDocument!)
        let jsonString = String(data: data, encoding: .utf8)!
        return jsonString
    }
}
