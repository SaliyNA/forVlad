//
//  ContentView.swift
//  WSR-CINEMA
//
//  Created by admin on 21.02.2023.
//

import SwiftUI

struct TextFieldForm: View{
    var color1: String
    var color2: String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 343,height: 45)
                .foregroundColor(Color(color1))
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 340,height: 43)
                .foregroundColor(Color(color2))
        }
}
}


struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State var isActive1 = false
    @State var isActive2 = false
    var body: some View {
        NavigationView{
            ZStack{
                Color("purp")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("wd")
                    Text("WorldCinema")
                        .foregroundColor(Color("or"))
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                    Spacer()
                    ZStack{
                        TextFieldForm(color1: "gr", color2: "purp")
                        TextField("E-mail", text: $email)
                            .frame(width: 330,height: 45)
                            .accentColor(.white)
                            .foregroundColor(Color("gr"))
                    }.padding(.bottom, 15)
                    ZStack{
                        TextFieldForm(color1: "gr", color2: "purp")
                        SecureField("Пароль", text: $password)
                            .frame(width: 330,height: 45)
                            .accentColor(.white)
                            .foregroundColor(Color("gr"))
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        NavigationLink(destination:MainView(), isActive: $isActive1){
                            Text("")
                        }
                        Button(action:{
                            self.isActive1 = true
                        }){
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 340,height: 45)
                                    .foregroundColor(Color("or"))
                                Text("Войти")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }.frame(width: 330,height: 45)
                        
                    }.padding(.bottom, 5)
                    
                    ZStack{
                        NavigationLink(destination:RegistrationView(), isActive: $isActive2){
                            Text("")
                        }
                        Button(action:{
                            self.isActive2 = true
                        }){
                            ZStack{
                                TextFieldForm(color1: "gr", color2: "purp")
                                Text("Регистрация")
                                    .foregroundColor(Color("or"))
                                    .fontWeight(.bold)
                            }
                        }
                    }.padding(.bottom, 20)
                    
                    
                    
                    
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
