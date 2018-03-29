//
//  Helpers.swift
//  DemoFirebaseStorage
//
//  Created by VuongDao on 3/4/18.
//  Copyright © 2018 VuongDao. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class Helpers {
    class func scaleImage(image : UIImage?) -> Data?
    {
        if let img = image
        {
            let maxWidth : CGFloat = 1080
            let maxHeight : CGFloat = 1920
            
            if img.size.width < maxWidth {
                
                if img.size.height <= maxHeight
                {
                    if let data = UIImageJPEGRepresentation(img, 0.5)
                    {
                        return data
                    }
                }
                    // height > 1920
                else
                {
                    // w/h = W/H
                    let rateMaxHeight = img.size.width / img.size.height
                    
                    
                    let scaledWidth = round(maxHeight * rateMaxHeight)
                    
                    
                    let rectMaxHeight = CGRect(x: 0.0, y: 0.0, width: scaledWidth , height: maxHeight)
                    
                    UIGraphicsBeginImageContext(rectMaxHeight.size)
                    img.draw(in: rectMaxHeight)
                    
                    let scaledImageMaxHeight : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                    
                    
                    let imageDataMaxHeight = UIImageJPEGRepresentation(scaledImageMaxHeight, 1.0)
                    return imageDataMaxHeight
                }
            }
            else{
                // width > 1080
                // h/w = H/W
                
                let rate = img.size.height / img.size.width
                
                
                let scaledHeight = round(maxWidth * rate)
                
                
                let rect = CGRect(x: 0.0, y: 0.0, width: maxWidth , height: scaledHeight)
                
                UIGraphicsBeginImageContext(rect.size)
                img.draw(in: rect)
                
                let scaledImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                
                // height > 1920
                if scaledImage.size.height > maxHeight {
                    // w/h = W/H
                    let rateMaxHeight = scaledImage.size.width / scaledImage.size.height
                    
                    let scaledWidth = round(maxHeight * rateMaxHeight)
                    
                    let rectMaxHeight = CGRect(x: 0.0, y: 0.0, width: scaledWidth , height: maxHeight)
                    
                    UIGraphicsBeginImageContext(rectMaxHeight.size)
                    scaledImage.draw(in: rectMaxHeight)
                    
                    let scaledImageMaxHeight : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                    
                    let imageDataMaxHeight = UIImageJPEGRepresentation(scaledImageMaxHeight, 1.0)
                    return imageDataMaxHeight
                }
                let imageData = UIImageJPEGRepresentation(scaledImage, 1.0)
                return imageData
            }
        }
        return nil
    }
}
