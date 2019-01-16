//
//  StoryboardFactory.swift
//  FleetWit
//
//  Created by Ethan Keiser on 1/16/19.
//  Copyright © 2019 Ethan Keiser. All rights reserved.
//


import Foundation
import UIKit

protocol ViewControllerFactory
{
    func createTopTableViewController() -> TopTableViewController
    func createDetailedViewController(imageUrlString: String) -> DetailedViewController
}

class StoryboardFactory
{
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
}

extension StoryboardFactory : ViewControllerFactory
{
    func createTopTableViewController() -> TopTableViewController {
        let vc = storyBoard.instantiateViewController(withIdentifier: "TopTableViewController") as! TopTableViewController
        return vc
    }
    
    func createDetailedViewController(imageUrlString: String) -> DetailedViewController {
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
        vc.imageUrlString = imageUrlString
        return vc
    }
}
