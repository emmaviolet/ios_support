//
//  UIImageExtensions.swift
//  FCUKInvestors
//
//  Created by Emma Makinson on 30/09/2016.
//  Copyright © 2016 Funding Circle. All rights reserved.
//

import Foundation

public extension UIImage {
    /**
     Returns a resized UIImage with the given width and the aspect ratio of the original image

     - returns: A UIImage
     */
    func aspectResizeWithWidth(width: CGFloat) -> UIImage {
        let scaleFactor = width / self.size.width
        return self.resizeWithScaleFactor(scaleFactor)
    }

    /**
     Returns a resized UIImage with the given height and the aspect ratio of the original image

     - returns: A UIImage
     */
    func aspectResizeWithHeight(height: CGFloat) -> UIImage {
        let scaleFactor = height / self.size.height
        return self.resizeWithScaleFactor(scaleFactor)
    }

    private func resizeWithScaleFactor(scaleFactor: CGFloat) -> UIImage {
        let newHeight = self.size.height * scaleFactor
        let newWidth = self.size.width * scaleFactor

        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        self.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
