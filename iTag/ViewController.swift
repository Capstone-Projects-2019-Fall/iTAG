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
    
    var text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
    var displayString : NSMutableAttributedString? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        highlightView.delegate = self
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19.0)]
        displayString = NSMutableAttributedString(string: text, attributes: attributes)
        highlightView.attributedText = displayString
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        print(textView.selectedRange)
        let startPosition = textView.selectedRange.lowerBound
        let length = textView.selectedRange.length
        let endPosition = startPosition + length
        if length != 0 {
            print("start: \(startPosition), end: \(endPosition), length: \(length)")
            displayString?.addAttribute(.backgroundColor, value: UIColor.yellow, range: NSRange(location: startPosition, length: length))
            textView.attributedText = displayString
        }
    }
    
    func highlightText(){
        
    }
    
}

