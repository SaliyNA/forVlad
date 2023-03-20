//
//  AuthView.swift
//  Ws23(sessions(1))
//
//  Created by admin on 17.03.2023.
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
struct AuthView: View {
    @State var email = "saliy.vlad.jr@gmail.com"
    @ObservedObject var viewModel = SignInRequest()
    @State var isAuth = false
    @EnvironmentObject var user: User
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    Image("hand")
                        .resizable()
                        .frame(width: 32,height:32)
                    NavigationLink(destination:VvodKodaView(), isActive: $isAuth){}
                }
                Text("Добро пожаловать!")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
            }.padding(.top, 50)
            Text("Войдите, чтобы пользоваться функциями\nприложения")
                .padding(.top, 10)
                .padding(.bottom, 50)
            Text("Вход по E-mail")
                .foregroundColor(Color.gray)
                .padding(.trailing, 220)
            if email != ""{
                TextField("", text: $email)
                    .frame(width: 335, height:48)
                    .background(Color("gray"))
                    .padding(1)
                    .cornerRadius(10)
                    .background(Color("grayy"))
                    .cornerRadius(10)
                
                Button(action:{
                    viewModel.signInFunc(email: self.email)
                    //user.email = self.email
                    isAuth = true
                }){
                    Text("Далее")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 335,height:56)
                        .background(Color("DarkBlue"))
                        .cornerRadius(10)
                }.padding(.top, 10)
            }
            else{
                TextField("", text: $email)
                    .frame(width: 335, height:48)
                    .background(Color("gray"))
                    .padding(1)
                    .cornerRadius(10)
                    .background(Color("grayy"))
                    .cornerRadius(10)
                    .opacity(0.5)
                
                
                    Text("Далее")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 335,height:56)
                        .background(Color("DarkBlue"))
                        .cornerRadius(10)
                        .padding(.top, 10)
                        .opacity(0.5)
            }
            
            Spacer()
            Text("Или войдите с помощью")
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .padding(.top, 200)
            Button(action:{}){
                Text("Войти с Яндекс")
                    .foregroundColor(.black)
                    .frame(width: 335,height: 60)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(1)
                        .background(Color("grayy"))
                        .cornerRadius(10)
            }
            Spacer()
        }.navigationBarHidden(true)
            .onAppear{viewModel.signInFunc(email: self.email)}
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
