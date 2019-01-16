//
//  Item.swift
//  FleetWit
//
//  Created by Ethan Keiser on 1/16/19.
//  Copyright © 2019 Ethan Keiser. All rights reserved.
//

import UIKit

struct Item: Generic, Decodable {
    var modhash: String?
    
    var dist: Int?
    
    var after: String?
    
    var children: [GenericDataType]?
    
    var before: String?
    
    var title: String?
    
    var author: String?
    
    var created: Double?
    
    var thumbnail: String?
    
    var num_comments: Int?
    

}
