//
//  NewsModel.swift
//  WS23(Sessions)
//
//  Created by admin on 16.03.2023.
//

import Foundation

struct NewsModel: Codable, Hashable{
    var id: Int
    var name: String
    var price: String
    var image: String
    var description: String
}
