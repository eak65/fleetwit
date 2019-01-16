//
//  UIImageView.swift
//  FleetWit
//
//  Created by Ethan Keiser on 1/16/19.
//  Copyright © 2019 Ethan Keiser. All rights reserved.
//
import UIKit
import Foundation
extension UIImageView
{
    func loadImageUsingUrlString(urlString: String)
    {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) in
            if error != nil {
                print(error)
                return
            }
            OperationQueue.main.addOperation {
                self.image = UIImage(data: data!)
            }
        }).resume()
    }
}
