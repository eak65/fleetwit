//
//  UIImageView.swift
//  FleetWit
//
//  Created by Ethan Keiser on 1/16/19.
//  Copyright © 2019 Ethan Keiser. All rights reserved.
//
import UIKit
import Foundation
import SVProgressHUD
let imageCache = NSCache<AnyObject, AnyObject>()
class CustomImageView: UIImageView
{
    var imageUrlString: String?
    func loadImageUsingUrlString(urlString: String)
    {
        imageUrlString = urlString
        let url = URL(string: urlString)
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage
        {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            OperationQueue.main.addOperation {
                 guard let imageToCache = UIImage(data: data!)
                    else{
                        SVProgressHUD.showError(withStatus: "Failed to display because data source is a video.")
                        return;
                }
                 if self.imageUrlString == urlString
                 {
                        self.image = imageToCache
                 }
                imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
            }
        }).resume()
    }
}
