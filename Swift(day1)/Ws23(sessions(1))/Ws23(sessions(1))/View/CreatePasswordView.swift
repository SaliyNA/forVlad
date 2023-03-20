//
//  CreatePasswordView.swift
//  Ws23(sessions(1))
//
//  Created by admin on 19.03.2023.
//

import SwiftUI

struct CircleFill: View{
    var coloor: Bool
    var body: some View{
        Circle()
//            .stroke(Color("dbb"))
//            .foregroundColor(coloor)
            .frame(width: 10)
            .foregroundColor(coloor ?  Color("DarkBlue") : .white)
            .cornerRadius(30)
            .padding(1)
            .background(Color("DarkBlue"))
            .cornerRadius(30)
            
            
    }
}





struct CreatePasswordView: View {
    @State var c1 = false
    @State var c2 = false
    @State var c3 = false
    @State var c4 = false
    @State var isActive = false
    var code: String
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Создайте пароль")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .padding(.bottom, 10)
                    .padding(.top, 80)
                Text("Для защиты ваших персональных данных")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .padding(.bottom, 40)
                
                HStack{
                    CircleFill(coloor: c1 )
                    CircleFill(coloor: c2 )
                    CircleFill(coloor: c3 )
                    CircleFill(coloor: c4 )
                    
                    
                }.padding(.bottom, 40)
                VStack{
                        
                        HStack(spacing: 20){
                            ButtonCircle(text:"1"){
                                ColorToggle()
                            }
                            ButtonCircle(text:"2"){
                                ColorToggle()
                            }
                            ButtonCircle(text:"3"){
                                ColorToggle()
                            }
                        }
                    }
                    HStack(spacing: 20){
                        ButtonCircle(text:"4"){
                            ColorToggle()
                        }
                        ButtonCircle(text:"5"){
                            ColorToggle()
                        }
                        ButtonCircle(text:"6"){
                            ColorToggle()
                        }
                    }
                    HStack(spacing: 20){
                        ButtonCircle(text:"7"){
                            ColorToggle()
                        }
                        ButtonCircle(text:"8"){
                            ColorToggle()
                        }
                        ButtonCircle(text:"9"){
                            ColorToggle()
                        }
                    }
                    HStack{
                        ButtonCircle(text:"0"){
                            ColorToggle()
                        }
                        .padding(.leading,73)
                        Image("del")
                            .resizable()
                            .frame(width: 34.5, height: 24)
                            .padding(.leading, 33)
                    }.padding(.top, 8)
                        .padding(.bottom, 40)
                NavigationLink(destination:PacientCardCreate(),isActive: $isActive){}
                    
                }
            }.navigationBarHidden(true)
        }
    
        func ColorToggle(){
            if !c1 {
                c1.toggle()
            }
            else if !c2{
                c2.toggle()
            }
            else if !c3{
                c3.toggle()
            }
            else {
                isActive = true
                c4.toggle()
                
            }
        
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView(code: "-1")
    }
}
