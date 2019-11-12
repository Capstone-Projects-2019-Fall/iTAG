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
    
    let documents = ["First Document", "Second Document", "Third Document"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        documentsTableView.delegate = self
        documentsTableView.dataSource = self
        
        openDocumentPicker()
    }
    
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        print(urls)
    }
    
    
    func openDocumentPicker() {
        // Do any additional setup after loading the view.
        let types: [String] = [kUTTypePDF as String]
        let documentPicker = UIDocumentPickerViewController(documentTypes: types, in: .import)
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .formSheet
        self.present(documentPicker, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell") as! DocumentCell
        cell.titleLabel.text = documents[indexPath.row]
        return cell
    }

}
