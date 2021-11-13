//
//  Item.swift
//  AppleCoding
//
//  Created by Naveen Chauhan on 09/11/21.
//

import UIKit


class Item: Hashable {
    
    var image: UIImage!
    let url: URL!
    let identifier = UUID()
    let detail: String!
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    init(detail:String,image: UIImage, url: URL) {
        self.detail = detail
        self.image = image
        self.url = url
    }

}
