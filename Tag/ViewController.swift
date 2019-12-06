//
//  ViewController.swift
//  Tag
//
//  Created by Qunchao Zhou on 2019/11/1.
//  Copyright © 2019年 Qunchao Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textinput: UITextField!
    
    @IBOutlet weak var textview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textinput.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func entertext(_ sender: Any) {
        textview.text = textinput.text!
    }
    
    
    
    
}
extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
