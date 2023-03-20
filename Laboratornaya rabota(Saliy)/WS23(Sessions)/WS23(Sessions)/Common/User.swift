//
//  VVodKodaModel.swift
//  WS23(Sessions)
//
//  Created by admin on 17.03.2023.
//

import Foundation
import Alamofire
class User: ObservableObject{
    @Published var error: String = ""
    @Published var token: String = ""
    @Published var code: String = ""
    @Published var email: String = ""
}
