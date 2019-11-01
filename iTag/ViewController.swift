//
//  ViewController.swift
//  iTag
//
//  Created by Leo Vergnetti on 11/1/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var highlightView: UITextView!
    
    var text = "Hi There Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        highlightView.text = text
        
    }


}

