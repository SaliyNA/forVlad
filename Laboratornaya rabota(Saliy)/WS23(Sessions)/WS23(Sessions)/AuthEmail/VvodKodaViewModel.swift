//
//  VvodKodaViewModel.swift
//  WS23(Sessions)
//
//  Created by admin on 16.03.2023.
//

import Foundation
import Alamofire

class AuthEmailViewModel: ObservableObject{
    @Published var  item: AuthEmailModel? = nil
   
    
    func requestAuth(email: String){
        AF.request("https://medic.madskill.ru/api/sendCode",
                   method: .post, //метод .post
                   headers: [
                    "email": email
                   ]
        )
        .responseDecodable(of: AuthEmailModel.self) { result in
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
