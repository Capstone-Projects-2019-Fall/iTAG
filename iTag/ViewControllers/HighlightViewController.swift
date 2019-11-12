//
//  HighlightViewController.swift
//  iTag
//
//  Created by Leo Vergnetti on 11/1/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import UIKit

class HighlightViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var highlightView: UITextView!
    @IBOutlet weak var highlightButton: UIButton!
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
    
    @IBAction func highlightButtonLongPressed(_ sender: UILongPressGestureRecognizer) {
        
        let alertController = UIAlertController(title: "Edit label", message: "Enter the label", preferredStyle: .alert)
            alertController.addTextField(){ $0.placeholder = "Label: Name"}
        let submit = UIAlertAction(title: "Change", style: .default) {
            [unowned alertController] _ in
            if let name = alertController.textFields![0].text{
                self.highlightButton.setTitle(name, for: .normal)
                self.tagModel.changeLabelName(newLabelName: name)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(submit)
        alertController.addAction(cancel)
        present(alertController, animated: true)
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
    @IBAction func previewButtonPressed(_ sender: Any) {
        let jsonText = tagModel.getCurrentDocumentAsJSONObject()
        let alertController = UIAlertController(title: "Preview JSON", message: jsonText, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(cancel)
        present(alertController, animated: true)
        
        print(tagModel.getCurrentDocumentAsJSONObject())
    }
    
}


