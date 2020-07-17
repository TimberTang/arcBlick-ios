//
//  ArcItem.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import Foundation

enum ArcItemType: String, Codable {
    case text = "text"
    case textImage = "text-img"
    case image = "img"
    case textLink = "text-link"
}

struct ArcItem: Codable {
    let arcId: Int
    let type: ArcItemType
    let content: String?
    let imgUrls: [String]?
    let link: String?
    
    enum CodingKeys: String, CodingKey {
        case arcId = "id"
        case type
        case content
        case imgUrls
        case link
    }
}
