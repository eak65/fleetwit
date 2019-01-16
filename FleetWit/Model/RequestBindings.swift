//
//  RequestBindings.swift
//  FleetWit
//
//  Created by Ethan Keiser on 1/16/19.
//  Copyright © 2019 Ethan Keiser. All rights reserved.
//

import Foundation

enum ItemType: String, Decodable {
    case Listing
    case t3
}

protocol Generic : Decodable
{
    var modhash: String? {get}
    var dist: Int? {get}
    var after: String? {get}
    var children: [GenericDataType]? {get}
    var before: String? {get}
    var title: String? {get}
    var author: String? {get}
    var created_utc: Double? {get}
    var thumbnail: String? {get}
    var num_comments: Int? {get}
}
enum GenericKeyStruct: String, CodingKey {
    case data = "data"
    case kind = "kind"

}
struct GenericDataType: Decodable {

    var kind: ItemType
    var listing: Listing?
    var item: Item?
    public init(from decoder: Decoder) throws {
        let container     = try decoder.container(keyedBy: GenericKeyStruct.self)
        kind = try container.decode(ItemType.self, forKey: .kind)
        switch self.kind {
            case .Listing:
                listing =  try container.decode(Listing.self, forKey: .data)

            case .t3:
                item =  try container.decode(Item.self, forKey: .data)
            }
    }
}

struct Listing : Decodable
{
    var modhash: String?
    
    var dist: Int?
    
    var after: String?
    
    var children: [GenericDataType]?
    
    var before: String?
}

