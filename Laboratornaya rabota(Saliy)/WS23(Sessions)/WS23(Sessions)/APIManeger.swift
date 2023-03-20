//
//  APIManeger.swift
//  WS23(Sessions)
//
//  Created by admin on 17.03.2023.
//

import Foundation
import Alamofire
public typealias FailureMessage = String

public class APIManager {
  public static let shared = APIManager()
  
  func callAPI(serverURL: String, method: HTTPMethod = .get, headers: HTTPHeaders? = nil, parameters: Parameters? = nil, success: @escaping ((AFDataResponse<Any>) -> Void), failure: @escaping ((FailureMessage) -> Void)) {
    
    guard var url = URLComponents(string: "\(serverURL)") else {
      failure("Invalid URL")
      return
    }
    // Network request
    AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
      .responseJSON { response in
        switch response.result {
        case .success:
          success(response)
        case let .failure(error):
          failure(error.localizedDescription)
        }
      }
  }
}

struct APIServices {
  public static let shared = APIServices()
  func callCreateLogin(parameters: Parameters? = nil, success: @escaping (_ result: CreateLoginResponse?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
    var headers = HTTPHeaders()
    headers["content-type"] = "application/json"
    APIManager.shared.callAPI(serverURL: "https://reqres.in/api/login", method: .post, headers: headers, parameters: parameters, success: { response in
      do {
        if let data = response.data {
          let createLoginResponse = try JSONDecoder().decode(CreateLoginResponse.self, from: data)
          success(createLoginResponse)
        }
      } catch {
        failure(FailureMessage(error.localizedDescription))
      }
    }, failure: { error in
      failure(FailureMessage(error))
    })
  }
}
