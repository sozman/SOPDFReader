//
//  ViewController.swift
//  Example
//
//  Created by Sinan Özman on 3.02.2021.
//

import UIKit
import SOPDFReader
import SnapKit

class ViewController: UIViewController {
    let examplePDFURL = "http://www.africau.edu/images/default/sample.pdf"
    var sopdfReaderController: UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sopdfReaderController = SOPDFReader.createModule(pdfLink: examplePDFURL)
        addChild(sopdfReaderController!)
        view.addSubview((sopdfReaderController?.view)!)
        
        sopdfReaderController?.view.snp.makeConstraints({ (make) in
            make.edges.equalTo(0)
        })
        
        sopdfReaderController?.didMove(toParent: self)
    }
}

