//
//  AuthViewModel.swift
//  Ws23(sessions(1))
//
//  Created by admin on 17.03.2023.
//

import Foundation
import Alamofire
class SignInRequest: ObservableObject{
    @Published var item: AuthModel? = nil
    
    func signInFunc(email: String){
        AF.request("https://medic.madskill.ru/api/sendCode", method: .post,
                   headers: ["email": email])
        .responseDecodable(of:AuthModel.self){ result in
            if case.success = result.result{
                self.item = result.value!
            }
            else{
                print(result.error)
            }
        }
    }
}
