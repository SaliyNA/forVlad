//
//  VVodKodaViewModel.swift
//  Ws23(sessions(1))
//
//  Created by admin on 19.03.2023.
//

import Foundation
import Alamofire

class VVodKodaViewModel: ObservableObject{
    @Published var log: VVodKodaModel? = nil
    @Published var email: String = ""
    @Published var code: String = ""
    
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
                self.log = result.value!
                print(self.log!.token)
            }
            else {
                print(result.error)

            }
        } //responseDecodable

       
    }
}
