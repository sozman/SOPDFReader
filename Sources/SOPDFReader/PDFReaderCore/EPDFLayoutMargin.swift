//
//  File.swift
//  
//
//  Created by Sinan Özman on 3.02.2021.
//

import Foundation
import UIKit

struct EPDFLayoutMargin {

    var horizontal: CGFloat
    var vertical: CGFloat

    static var zero: EPDFLayoutMargin {
        return EPDFLayoutMargin(horizontal: 0.0, vertical: 0.0)
    }
}

extension EPDFLayoutMargin {
    init(margin: CGFloat) {
        self.horizontal = margin
        self.vertical = margin
    }
}
