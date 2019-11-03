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
    
    var currentDocument : Document? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SET UP higlightView
        highlightView.delegate = self
        
        //Create Test Document
        currentDocument = Document()
        
        //Set up text display properties in highlightView
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19.0)]
        let displayString = NSMutableAttributedString(string: currentDocument!.content, attributes: attributes)
        
        highlightView.attributedText = displayString
    }
    
    
    
    @IBAction func highlightButtonPressed(_ sender: UIButton) {
        let selectedRange = highlightView.selectedRange
        if selectedRange.length != 0 {
            currentDocument?.addAnnotation(range: selectedRange)
            print("Selected Range: \(selectedRange)")
            drawHighlights()
        }
    }
    
    
    
    func drawHighlights(){
        
        let displayString = NSMutableAttributedString(attributedString: highlightView.attributedText)
        
        //loop the list of annotations, adding a highlight attribute for each one
        currentDocument?.annotations.forEach {
            displayString.addAttribute(.backgroundColor, value: UIColor.yellow, range: $0.range)
        }
        
        //Add the text to highlightView
        highlightView.attributedText = displayString
    }
    
}


