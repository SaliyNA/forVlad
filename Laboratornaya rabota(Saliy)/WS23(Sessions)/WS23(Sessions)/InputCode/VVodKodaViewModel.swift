//
//  VVodKodaViewModel.swift
//  WS23(Sessions)
//
//  Created by admin on 17.03.2023.
//

import Foundation
import Alamofire

class VVodKodaViewModel: ObservableObject{
    @Published var log: VVodKodaModel = .init(token: "")
    @Published var email: String = ""
    @Published var code: String = ""
    @Published var isActive: Bool = false
    
    weak private var user: User?
    
    init(user: User) {
      self.user = user
    }
    
    func requestSignIn(){
       
        AF.request("https://medic.madskill.ru/api/signin",
                   method: .post,
                   headers: [
                    "email": self.email,
                    "code": self.code
                   ]
        )
        .responseDecodable(of: VVodKodaModel.self) { result in
            if case .success = result.result {
                print("yes123")
                self.log = result.value!
                self.user?.token = self.log.token
                self.isActive = true
                print("Token: \(self.log.token)")
            }
            else {
                print(result.error)
            }
        } //responseDecodable

       
    }
}
