//
//  CatalogModel.swift
//  Ws23(sessions(1))
//
//  Created by admin on 20.03.2023.
//

import Foundation
struct NewsModel: Codable, Hashable{
    var id: Int
    var name: String
    var description: String
    var price: String
    var image: String
}
