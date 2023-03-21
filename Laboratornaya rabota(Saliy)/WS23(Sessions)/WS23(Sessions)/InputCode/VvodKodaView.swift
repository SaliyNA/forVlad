//
//  VvodKoda.swift
//  WS23(Sessions)
//
//  Created by admin on 28.02.2023.
//

import SwiftUI
import Alamofire





struct VvodKodaView: View {
    @State private var okno1 = ""
    @State private var okno2 = ""
    @State var token: String = ""
    @State var code: String = ""
    @State private var okno3 = ""
    @State private var okno4 = ""
    @State var isActive  = false
    @State var timerVal: Int = 60
    @EnvironmentObject var user: User
    @State var s = ""
    @StateObject var viewModel: VVodKodaViewModel
    @State var item: VVodKodaModel? = nil
    var body: some View {
        VStack{
            Text("Введите код из E-mail")
            HStack{
                TextField("", text: $okno1)
                    .frame(width: 40, height: 40)
                    .background(Color("gg"))
                    .cornerRadius(4)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                TextField("", text: $okno2)
                    .frame(width: 40, height: 40)
                    .background(Color("gg"))
                    .cornerRadius(4)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                TextField("", text: $okno3)
                    .frame(width: 40, height: 40)
                    .background(Color("gg"))
                    .cornerRadius(4)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                TextField("", text: $okno4, onEditingChanged: {_ in 
                    if okno1 != "" && okno2 != "" && okno3 != "" && okno4 != "" {
                        self.code = okno1+okno2+okno3+okno4
                        print(self.code + " " + user.email)
                        self.viewModel.email = user.email
                        
                        self.viewModel.code = code
                        self.viewModel.requestSignIn()
//                        print("Token: \(self.viewModel.log?.token)")
//                        AF.request("https://medic.madskill.ru/api/signin",
//                                   method: .post,
//                                   headers: [
//                                    "email": user.email,
//                                    "code": self.code
//                                   ]
//                        )
//                        .responseDecodable(of: VVodKodaModel.self) { result in
//
//                            if case .success = result.result {
//                                self.item = result.value!
//                                user.token = self.item!.token
//                                print(user.token)
//                            }
//                            else {
//                                print(result.error)
//
//                            }
//                        } //responseDecodable
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                            print("Token view:\(self.viewModel.log.token)")
//                        }
                        if let token2 = self.item {
                            self.user.token = token2.token
                        }
//                        self.isActive = true
                      }
                })
                .frame(width: 40, height: 40)
                .background(Color("gg"))
                .cornerRadius(4)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
            }
            
            
            ZStack{
              
                NavigationLink(destination:CreatePasswordView(code: s), isActive: $viewModel.isActive){
                    EmptyView()
                }
                Text("Отправить код повторно можно\n       будет через \(timerVal) секунд")
                
                
            }
                
            
        }.navigationBarHidden(true)
            .onAppear(){
                
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
                    if self.timerVal > 0 {self.timerVal -= 1}
                }
                
            }.navigationBarHidden(true)
    
    }
}


