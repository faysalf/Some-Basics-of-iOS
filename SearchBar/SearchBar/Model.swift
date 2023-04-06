//
//  Model.swift
//  SearchBar
//
//  Created by Md. Faysal Ahmed on 26/3/23.
//

import UIKit

struct Restaurant {
    let name: String
    let location: String
    let star: Double
    let image: String
    
    init(name: String, location: String, star: Double, image: String) {
        self.name = name
        self.location = location
        self.star = star
        self.image = image
    }
}
