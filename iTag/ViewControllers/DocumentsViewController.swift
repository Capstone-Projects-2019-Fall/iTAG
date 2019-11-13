//
//  DocumentsViewController.swift
//  iTag
//
//  Created by Leo Vergnetti on 11/11/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import UIKit
import MobileCoreServices


class DocumentsViewController: UIViewController, UIDocumentPickerDelegate, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var documentsTableView: UITableView!

    var tagModel = TagModel.sharedInstance
    
    var documents = TagModel.sharedInstance.openDocuments
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        documentsTableView.delegate = self
        
        documentsTableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self , action: #selector(openDocumentPicker))
        
    }
    

    
    @objc func openDocumentPicker() {
        // Do any additional setup after loading the view.
        let types: [String] = [kUTTypeText as String]
        
        let documentPicker = UIDocumentPickerViewController(documentTypes: types, in: .import)
        
        documentPicker.delegate = self
        
        documentPicker.modalPresentationStyle = .formSheet
        
        self.tabBarController!.present(documentPicker, animated: true, completion: nil)
    }
    
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
 
        
        do{
            let text = try String(contentsOf: urls[0], encoding: .utf8)
            
            let name = String(urls[0].lastPathComponent)
            
            let document = Document(title: name, content: text)
            
            TagModel.sharedInstance.addDocument(document: document)
            
            documents = TagModel.sharedInstance.openDocuments
            
            documentsTableView.reloadData()
            
        }
            
        catch{
            
            print("Couldn't read file at url: \(urls[0])")
            
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return documents.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell") as! DocumentCell
        
        cell.titleLabel.text = documents[indexPath.row].title
        
        return cell
    }

}
