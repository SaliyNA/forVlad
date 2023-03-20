//
//  VVodKodaModel.swift
//  WS23(Sessions)
//
//  Created by admin on 17.03.2023.
//

import Foundation
struct VVodKodaModel: Codable{
    var token: String
}

//Request
struct CreateLoginRequest: Codable {
  var email: String?
  var code: String?
}
//Response
struct CreateLoginResponse: Codable {
  var token: String
}

