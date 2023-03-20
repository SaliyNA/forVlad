//
//  Hub.swift
//  WS23(Sessions)
//
//  Created by admin on 26.02.2023.
//

import SwiftUI
import Alamofire

struct baza: View{
    @State var color1: Color
    @State var color2: Color
    @State var height: CGFloat
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(color1)
                .frame(width: 335,height: height)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(color2)
                .frame(width: 333,height: height+2)
        }
        
    }
}

struct Hub: View {
    @State var email: String = "saliy.na@mail.ru"
    @State var isAuth = false
    @ObservedObject var viewModel = AuthEmailViewModel()
    @EnvironmentObject var user: User
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination:VvodKodaView(),isActive: $isAuth){}
                HStack{
                    Image("hand")
                        .resizable()
                        .frame(width: 32,height: 32)
                    Text("Добро пожаловать!")
                        .fontWeight(.bold)
                }
                Text("Войдите, чтобы пользоваться функциями\nприложения")
                
                HStack{
                    Text("Вход по E-mail")
                        .padding(.leading, 30)
                    Spacer()
                }
                ZStack{
                    baza(color1: Color("gg"), color2: Color("ggg"), height: 48)
                    TextField("", text: $email)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.gray)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                

                Button(action:{
                    viewModel.requestAuth(email: self.email)
                    user.email = self.email
                    isAuth = true
                }
                ){
                    ZStack{
                        baza(color1: Color("db"), color2: Color("db"), height: 56)
                        Text("Далее")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }}
                    .disabled(email.isEmpty)
                    .opacity(email.isEmpty ? 0.5 : 1)
                    .padding(.bottom, 150)
                
                
                Text("Или войдите с помощью")
                    .foregroundColor(.gray)
                NavigationLink(destination:ContentView()){
                    ZStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color("gg"))
                                .frame(width: 335,height: 60)
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color("ggg"))
                                .frame(width: 333,height: 57)
                        }
                        Text("Войти с помощью Яндекса")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                }
                
                
            }
        }.navigationBarHidden(true)
    }
}

struct Hub_Previews: PreviewProvider {
    static var previews: some View {
        Hub()
    }
}
