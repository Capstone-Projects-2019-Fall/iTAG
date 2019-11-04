//
//  ViewController.swift
//  iTag
//
//  Created by Leo Vergnetti on 11/1/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var highlightView: UITextView!
    let tagModel = TagModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SET UP higlightView
        highlightView.delegate = self
        
        //Set up text display properties in highlightView
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8 
        paragraphStyle.lineHeightMultiple = 1.5
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0), NSAttributedString.Key.paragraphStyle : paragraphStyle]
        
        if let content = tagModel.getCurrentDocumentText() {
            let displayString = NSMutableAttributedString(string: content, attributes: attributes)
            highlightView.attributedText = displayString
        } else{
            highlightView.text = "No document selected"
            
        }
    }
    
    
    @IBAction func highlightButtonPressed(_ sender: UIButton) {
        
        let selectedRange = highlightView.selectedRange
        
        if (tagModel.addAnnotation(range: selectedRange)){
            print("Added annotation for range: \(selectedRange)")
            drawHighlights()
        } else{
            print("Unable to add Annotation")
        }
    }
    
    
    
    func drawHighlights(){
        
        let displayString = NSMutableAttributedString(attributedString: highlightView.attributedText)
        
        //loop the list of annotations, adding a highlight attribute for each one
        let highlightRanges = tagModel.getAnnotationRangesForCurrentDocument()
        highlightRanges?.forEach {
            displayString.addAttribute(.backgroundColor, value: UIColor.yellow, range: $0)
        }
        
        //Add the text to highlightView
        highlightView.attributedText = displayString
    }
    @IBAction func convertButtonPressed(_ sender: Any) {
        print(tagModel.getCurrentDocumentAsJSONObject())
        
    }
    
}


