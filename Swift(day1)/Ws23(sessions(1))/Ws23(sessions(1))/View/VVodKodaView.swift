//
//  VVodKodaView.swift
//  Ws23(sessions(1))
//
//  Created by admin on 19.03.2023.
//

import SwiftUI

struct VvodKodaView: View {
    @State private var okno1 = ""
    @State private var okno2 = ""
    @State private var okno3 = ""
    @State private var okno4 = ""
    @State var isActive  = false
    @State var timerVal: Int = 60
    @EnvironmentObject var user: User
    @State var s = ""
    @ObservedObject var viewModel = VVodKodaViewModel()
    var body: some View {
        VStack{
            Text("Введите код из E-mail")
            HStack{
                TextField("", text: $okno1)
                    .frame(width: 40, height: 40)
                    .background(Color("gray"))
                    .cornerRadius(4)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                TextField("", text: $okno2)
                    .frame(width: 40, height: 40)
                    .background(Color("gray"))
                    .cornerRadius(4)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                TextField("", text: $okno3)
                    .frame(width: 40, height: 40)
                    .background(Color("gray"))
                    .cornerRadius(4)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                TextField("", text: $okno4, onEditingChanged: {_ in
                    if okno1 != "" && okno2 != "" && okno3 != "" && okno4 != "" {
                        self.viewModel.code = okno1+okno2+okno3+okno4
                        //self.viewModel.email = user.email
                        self.viewModel.requestSignIn()
                        if let token2 = self.viewModel.log {
                            self.user.token = token2.token
                            print(token2.token)
                        }
                        print(self.viewModel.log?.token)
                       // print(user.token)
                        print("321")
                        self.isActive = true
                      }
                })
                .frame(width: 40, height: 40)
                .background(Color("gray"))
                .cornerRadius(4)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
            }
            
            
            ZStack{
              
                NavigationLink(destination:CreatePasswordView(code: s), isActive: $isActive){
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


struct VVodKodaView_Previews: PreviewProvider {
    static var previews: some View {
        VvodKodaView()
    }
}
