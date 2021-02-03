//
//  File.swift
//  
//
//  Created by Sinan Özman on 3.02.2021.
//

import QuartzCore

extension CGPDFPage {
    func size(for box: CGPDFBox, intersectsWithMediaBox: Bool = true) -> CGSize {
        var boxRect = self.getBoxRect(box)
        if intersectsWithMediaBox {
            let mediaBox = self.getBoxRect(.mediaBox)
            boxRect = mediaBox.intersection(boxRect)
        }
        let transform = CGAffineTransform.init(rotationAngle: self.rotationAngle.degreesToRadians)
        let rotatedRect = boxRect.applying(transform)
        return rotatedRect.size
    }
}
