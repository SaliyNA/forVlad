//
//  CreataPacientCard.swift
//  Ws23(sessions(1))
//
//  Created by admin on 19.03.2023.
//

import SwiftUI

struct PacientCardCreate: View {
    @State var otchestvo = ""
    @State var password = ""
    @State var name = ""
    @State var surname = ""
    @State var data = ""
    @State var pol = ""
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Создание карты\nпациента")
                        .font(.system(size: 25, weight: .bold))
                        .padding(.leading, 25)
                        .padding(.bottom, 10)
                    Spacer()
                }
                
                Text("Без карты пациента вы не сможете заказать анализы.")
                    .padding(.bottom,5)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                Text("В картах пациентов будут храниться результаты\nанализов и ваших близких")
                    .font(.system(size: 13))
                    .padding(.trailing, 35)
                    .foregroundColor(.gray)
                
                ZStack{
                    baza(color1: Color("grayy"), color2: Color("gray"), height: 48)
                    TextField("Имя", text: $name)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("grayy"), color2: Color("gray"), height: 48)
                    TextField("Отчество", text: $otchestvo)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("grayy"), color2: Color("gray"), height: 48)
                    TextField("Фамилия", text: $surname)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("grayy"), color2: Color("gray"), height: 48)
                    TextField("Дата рождения", text: $data)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("grayy"), color2: Color("gray"), height: 48)
                    TextField("Пол", text: $pol)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                
                if name.isEmpty || surname.isEmpty || pol.isEmpty || data.isEmpty || otchestvo.isEmpty{
                    Text("Далее")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 335,height: 56)
                        .background(Color("DarkBlue"))
                        .cornerRadius(12)
                        .opacity(0.5)
                        .padding(.bottom, 150)
                    
                }
                else{
                    NavigationLink(destination:CatalogView()){
                        ZStack{
                            baza(color1: Color("DarkBlue"), color2: Color("DarkBlue"), height: 56)
                            Text("Далее")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }.padding(.bottom, 150)
                }
                
                
                
            }
        }.navigationBarHidden(true)
    }
}
struct CreataPacientCard_Previews: PreviewProvider {
    static var previews: some View {
        PacientCardCreate()
    }
}
