//
//  Burger.swift
//  BigBurger
//
//  Created by walid nakbi on 22/7/2021.
//

import Foundation
class BurgerElement: Decodable {
    let ref, title, burgerDescription: String
    let thumbnail: String
    let price: Float

    enum CodingKeys: String, CodingKey {
        case ref, title
        case burgerDescription = "description"
        case thumbnail, price
    }

    init(ref: String, title: String, burgerDescription: String, thumbnail: String, price: Float) {
        self.ref = ref
        self.title = title
        self.burgerDescription = burgerDescription
        self.thumbnail = thumbnail
        self.price = price
    }
}

typealias Burger = [BurgerElement]
