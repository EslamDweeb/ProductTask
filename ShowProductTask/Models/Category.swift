//
//  Category.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import Foundation
// MARK: - Category
struct Category: Codable {
    let createdAt, updatedAt: String
    let id: Int
    let nameEn, nameAr: String
    let isActive: Bool
    let link: Link

    enum CodingKeys: String, CodingKey {
        case createdAt, updatedAt, id
        case nameEn = "name_en"
        case nameAr = "name_ar"
        case isActive = "is_active"
        case link = "Link"
    }
}
