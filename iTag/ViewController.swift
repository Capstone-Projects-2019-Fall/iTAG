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
    
    var text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32."
    
    var displayString : NSMutableAttributedString? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        highlightView.delegate = self
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19.0)]
        displayString = NSMutableAttributedString(string: text, attributes: attributes)
        highlightView.attributedText = displayString
    }
    
    func highlightText(){
        
    }
    @IBAction func highlightButtonPressed(_ sender: UIButton) {
        let selectedRange = highlightView.selectedRange
        print("Selected Range: \(highlightView.selectedRange)")
        if selectedRange.length != 0 {
            print("\(sender)")
            displayString?.addAttribute(.backgroundColor, value: UIColor.yellow, range: selectedRange)
            highlightView.attributedText = displayString
        }
    }
    
}


