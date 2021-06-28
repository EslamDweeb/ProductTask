//
//  ProductData.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import Foundation
// MARK: - ProductData
struct ProductData: Codable {
    let data: Products
    let errors, meta: String
}

// MARK: - DataClass
struct Products: Codable {
    let products: [Product]
    let message: String
}
