//
//  RegistrationView.swift
//  WSR-CINEMA
//
//  Created by admin on 21.02.2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var name = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var password1 = ""
    @State private var password2 = ""
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
                    Spacer()
                    VStack{
                        ZStack{
                            TextFieldForm(color1: "gr", color2: "purp")
                            TextField("Имя", text: $name)
                                .frame(width: 330,height: 45)
                                .accentColor(.white)
                                .foregroundColor(Color("gr"))
                        }.padding(.bottom, 10)
                        ZStack{
                            TextFieldForm(color1: "gr", color2: "purp")
                            TextField("Фамилия", text: $surname)
                                .frame(width: 330,height: 45)
                                .accentColor(.white)
                                .foregroundColor(Color("gr"))
                        }.padding(.bottom, 10)
                        
                        ZStack{
                            TextFieldForm(color1: "gr", color2: "purp")
                            TextField("E-mail", text: $email)
                                .frame(width: 330,height: 45)
                                .accentColor(.white)
                                .foregroundColor(Color("gr"))
                        }.padding(.bottom, 10)
                        
                        ZStack{
                            TextFieldForm(color1: "gr", color2: "purp")
                            SecureField("Пароль", text: $password1)
                                .frame(width: 330,height: 45)
                                .accentColor(.white)
                                .foregroundColor(Color("gr"))
                        }.padding(.bottom, 10)
                        ZStack{
                            TextFieldForm(color1: "gr", color2: "purp")
                            SecureField("Повторите пароль", text: $password2)
                                .frame(width: 330,height: 45)
                                .accentColor(.white)
                                .foregroundColor(Color("gr"))
                        }.padding(.bottom, 10)
                        
                        
                        Spacer()
                        
                        ZStack{
                            NavigationLink(destination:ContentView(), isActive: $isActive1){
                                Text("")
                            }
                            Button(action:{
                                self.isActive1 = true
                            }){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 340,height: 45)
                                        .foregroundColor(Color("or"))
                                    Text("Зарегестрироваться")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                            }.frame(width: 330,height: 45)
                            
                        }.padding(.bottom, 5)
                        
                        ZStack{
                            NavigationLink(destination:ContentView(), isActive: $isActive2){
                                Text("")
                            }
                            Button(action:{
                                self.isActive2 = true
                            }){
                                ZStack{
                                    TextFieldForm(color1: "gr", color2: "purp")
                                    Text("У меня уже есть аккаунт")
                                        .foregroundColor(Color("or"))
                                        .fontWeight(.bold)
                                }
                            }
                        }.padding(.bottom, 20)
                        
                        
                        
                        
                    }
                    .padding()
                }
            }
        }.navigationBarHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
