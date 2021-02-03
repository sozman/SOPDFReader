//
//  File.swift
//  
//
//  Created by Sinan Özman on 3.02.2021.
//

import Foundation
import UIKit

class EPDFPageViewController: UIViewController {
    // MARK: - Property
    private var page: CGPDFPage?
    var pageNumber: Int? {
        return self.page?.pageNumber
    }

    var alignment: EPDFPageAlignment = .center {
        didSet {
            self.pageImageView.alignment = self.alignment
            self.pageDrawView.alignment = self.alignment
        }
    }

    private weak var pageImageView: EPDFPageImageView!
    private weak var pageDrawView: EPDFPageDrawView!

    // MARK: - Initializer
    convenience init(page: CGPDFPage?, box: CGPDFBox, backgroundColor: UIColor) {
        self.init(nibName: nil, bundle: nil)

        // Set Page
        self.page = page

        // Setup
        if let page = self.page {
            // Set Background Color
            self.view.backgroundColor = backgroundColor

            // Setup Page Image View
            let pageImageView = EPDFPageImageView(page: page, box: box, size: UIScreen.main.fixedCoordinateSpace.bounds.size)
            pageImageView.alignment = self.alignment
            pageImageView.fillColor = backgroundColor
            pageImageView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(pageImageView)
            self.pageImageView = pageImageView

            // Setup Page Draw View
            let pageDrawView = EPDFPageDrawView(page: page, box: box)
            pageDrawView.alignment = self.alignment
            pageDrawView.fillColor = backgroundColor
            pageDrawView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(pageDrawView)
            self.pageDrawView = pageDrawView

            // Add Constraints
            var constraints = [NSLayoutConstraint]()
            constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: ["view": pageImageView]))
            constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view": pageImageView]))
            constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: ["view": pageDrawView]))
            constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view": pageDrawView]))
            NSLayoutConstraint.activate(constraints)
        }
    }

    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
