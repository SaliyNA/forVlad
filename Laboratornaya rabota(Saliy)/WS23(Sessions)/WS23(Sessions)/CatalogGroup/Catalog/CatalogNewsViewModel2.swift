//
//  CatalogNewsViewModel2.swift
//  WS23(Sessions)
//
//  Created by admin on 16.03.2023.
//

import Foundation
import Alamofire
class CatalogNewsViewModel2: ObservableObject{
    @Published var items2: [CatalogModel] = []
    @Published var itemm: CatalogModel? = nil
    @Published var schetchik: Int = 0
    
    func myCount(item2: CatalogModel){
        self.itemm = item2
        self.schetchik += Int(item2.price)!
      //  print(self.itemm!.name)
    }
    
    func myMinus(item2: CatalogModel){
        self.itemm = item2
        self.schetchik -= Int(item2.price)!
      //  print(self.itemm!.name)
    }
    
    func catalogRequest(){
        AF.request("https://medic.madskill.ru/api/catalog")
            .responseDecodable(of: [CatalogModel].self) { [self] result2 in
                if case .success = result2.result {
                    print("yyeess")
                    self.items2 = result2.value!
                    self.itemm = items2[0]
                    
                  //  schetchik = Int(self.items2[0].price)!
                }
                else {
                    print("no")
                    print(result2.error)
                }
            }
    }
}
