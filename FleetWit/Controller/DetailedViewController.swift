//
//  DetailedViewController.swift
//  FleetWit
//
//  Created by Ethan Keiser on 1/16/19.
//  Copyright © 2019 Ethan Keiser. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    var imageUrlString : String!
    @IBOutlet weak var imageView: CustomImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let imageUrlString = imageUrlString, !imageUrlString.isEmpty else {
            self.navigationController?.popViewController(animated: true)
            return
            }
        self.imageView.loadImageUsingUrlString(urlString: imageUrlString)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveImage))
    }
    @objc func saveImage()
    {
        UIImageWriteToSavedPhotosAlbum(self.imageView.image!, nil, nil, nil);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
