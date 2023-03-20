//
//  SendCodeViewModel.swift
//  Ws23(sessions(1))
//
//  Created by admin on 19.03.2023.
//

import Foundation
import Alamofire

class AuthEmailViewModel: ObservableObject{
    @Published var  item: AuthModel? = nil
    func requestAuth(email: String){
        AF.request("https://medic.madskill.ru/api/sendCode",
                   method: .post, //метод .post
                   headers: [
                    "email": email
                   ]
        )
        .responseDecodable(of: AuthModel.self) { result in
            if case .success = result.result {
                //если результат получен, то isAuth становится истинным
                print("yes")
                self.item = result.value!
            }
            else {
                print(result.error)
            }
        } //responseDecodable
    }
    
    
}
