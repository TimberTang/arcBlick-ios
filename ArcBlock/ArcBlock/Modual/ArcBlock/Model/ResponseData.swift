//
//  ResponseData.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import Foundation

struct ResponseData: Codable {
    var code: Int
    var msg: String
    var data: [ArcItem]
}
