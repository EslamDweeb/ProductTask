//
//  Product.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import Foundation
// MARK: - Product
struct Product: Codable {
    let nameEn: String
    let links: [Link]

    enum CodingKeys: String, CodingKey {
        case nameEn = "name_en"
        case links = "Links"
    }
}
