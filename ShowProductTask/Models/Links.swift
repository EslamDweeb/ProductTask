//
//  Links.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import Foundation
// MARK: - Link
struct Link: Codable {
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case link
    }
}

