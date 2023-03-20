//
//  CatalogViewModel.swift
//  Ws23(sessions(1))
//
//  Created by admin on 20.03.2023.
//

import Foundation
import Alamofire

class NewsViewModel: ObservableObject{
    @Published var items: [NewsModel] = []
    
    func newsRequest(){
        AF.request("https://medic.madskill.ru/api/news")
            .responseDecodable(of: [NewsModel].self) { result in
                if case .success = result.result {
                    self.items = result.value!
                }
                else{
                    print(result.error)
                }
            }
    }
    
}
