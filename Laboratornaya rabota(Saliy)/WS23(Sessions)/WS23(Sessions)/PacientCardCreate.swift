//
//  PacientCardCreate.swift
//  WS23(Sessions)
//
//  Created by admin on 03.03.2023.
//

import SwiftUI
import Alamofire

struct PacientCardCreateModel: Codable{
//    var id: Int
//    var user_id: Int
    var firstname: String
}


struct PacientCardCreate: View {
    @State var otchestvo = ""
    @State var password = ""
    @State var name = ""
    @State var surname = ""
    @State var data = ""
    @State var isNext = false
    @State var pol = ""
    @State var item: PacientCardCreateModel? = nil
    @EnvironmentObject var user: User
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
                    baza(color1: Color("gg"), color2: Color("ggg"), height: 48)
                    TextField("Имя", text: $name)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("gg"), color2: Color("ggg"), height: 48)
                    TextField("Отчество", text: $otchestvo)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("gg"), color2: Color("ggg"), height: 48)
                    TextField("Фамилия", text: $surname)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("gg"), color2: Color("ggg"), height: 48)
                    TextField("Дата рождения", text: $data)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("gg"), color2: Color("ggg"), height: 48)
                    TextField("Пол", text: $pol)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                
                if name.isEmpty || surname.isEmpty || pol.isEmpty || data.isEmpty || otchestvo.isEmpty{
                    Text("Создать")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 335,height: 56)
                        .background(Color("db"))
                        .cornerRadius(12)
                        .opacity(0.5)
                        .padding(.bottom, 150)
                }
                else{
                    NavigationLink(destination:CatalogView(), isActive: $isNext){}
                    Button(action:{
                        let headers : HTTPHeaders =  ["Authorization": "Bearer \(user.token)"]
                        AF.request("https://medic.madskill.ru/api/createProfile",
                                   method: .post,
                                   parameters: ["firstname": self.name,
                                                "lastname": self.surname,
                                                "middlename": self.otchestvo,
                                                "bith": self.data,
                                                "pol": self.pol,
                                                "image": "1"
                                               ],
                                   headers: headers)
                        .responseDecodable(of: PacientCardCreateModel.self){ result in
                            if case.success = result.result{
                                self.item = result.value!
                                print(item!.firstname)
                            }
                            else{
                                print(result.error)
                            }
                        }
                    }){
                        ZStack{
                            baza(color1: Color("db"), color2: Color("db"), height: 56)
                            Text("Создать")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }.padding(.bottom, 150)
                }
            }
        }.navigationBarHidden(true)
    }
}

struct PacientCardCreate_Previews: PreviewProvider {
    static var previews: some View {
        PacientCardCreate()
    }
}
