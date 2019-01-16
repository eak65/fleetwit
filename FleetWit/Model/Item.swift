//
//  Item.swift
//  FleetWit
//
//  Created by Ethan Keiser on 1/16/19.
//  Copyright © 2019 Ethan Keiser. All rights reserved.
//

import UIKit

struct Item: Decodable {

    var title: String
    var author: String
    var created_utc: Double
    var thumbnail: String
    var num_comments: Int
    var url : String
}
