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
    var currentDocument : Document? {
        return openDocuments[currentDocumentIndex]
    }
    var currentDocumentIndex : Int
    var categories : [String]
    
    static let sharedInstance = TagModel()
    private init(){
        let document = Document()
        self.openDocuments = [document]
        self.currentDocumentIndex = 0
//        self.currentDocument = document
        self.categories = ["Label"]
    }
    
    func addAnnotation(range: NSRange) -> Bool{
        if range.length != 0, let document = currentDocument {
            document.addAnnotation(range: range, label: self.categories[0])
            return true
        }
        return false
    }
    
    func addDocument(document: Document) {
        openDocuments.append(document)
    }
    
    func nextDocument(){
        currentDocumentIndex = (currentDocumentIndex + 1) % openDocuments.count
        
    }
    
    func getCurrentDocumentText() -> String? {
        return openDocuments[currentDocumentIndex].content
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
