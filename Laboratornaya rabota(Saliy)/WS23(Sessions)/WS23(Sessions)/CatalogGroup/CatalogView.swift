//
//  CatalogView.swift
//  WS23(Sessions)
//
//  Created by admin on 04.03.2023.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI








//struct NewsView: View {
//    @State var items: [Data2] = []
//    var body: some View {
//        Text("1")
//    }
//}

struct SheetView: View{
    var item2: CatalogModel
    var body: some View{
        VStack{
            Text(item2.name)
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.black)
                .padding(.top, 20)
            Text("Описание")
                .foregroundColor(Color("gray"))
                .fontWeight(.medium)
            Text(item2.description)
                .font(.system(size: 15))
                .foregroundColor(.black)
            Text("Подготовка")
                .foregroundColor(Color("gray"))
                .fontWeight(.medium)
                .padding(.top, 5)
                .padding(.bottom, 5)
            Text(item2.preparation)
                .font(.system(size: 15))
                .padding(.trailing, 40)
                .foregroundColor(.black)
            Spacer()
            HStack{
                VStack{
                    Text("Результаты через:")
                        .foregroundColor(Color("gray"))
                    Text(item2.time_result)
                        .foregroundColor(.black)
                }.padding(.leading, 30)
                Spacer()
                VStack{
                    Text("Биоматериал:")
                        .foregroundColor(Color("gray"))
                    Text(item2.bio)
                        .foregroundColor(.black)
                }.padding(.trailing, 30)
            }.padding(.top, 10)
            Button(action:{}){
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color("db"))
                        .frame(width:335, height:56)
                    Text("Добавить за \(item2.price)$")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
            
            
        }
    }
}


struct FirstScreen: View{
    @State var search = ""
    @State var changed1 = false
   // @State var items: [Data2] = []
    @State var isActive = false
    var schetchik = 0
    var body: some View{
        ZStack{
            
            LinearGradient(colors: [Color("white"),Color("ggg")], startPoint: .top, endPoint: .bottom)
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 9)
                        .foregroundColor(Color("ggg"))
                        .frame(width:335 ,height:48)
                        .padding(1)
                        .background(Color("gg"))
                        .cornerRadius(9)
                    HStack{
                        Image("search")
                        TextField("Искать анализы", text:$search, onEditingChanged: {
                            (changed) in
                            self.changed1.toggle()
                            print("Username onEditingChanged \(changed)")
                        })
                        .frame(width:280 ,height:48)
                    }
                }
                if changed1 == false && search == ""{
                    
                    HStack{
                        Text("Акции и новости")
                            .foregroundColor(.gray)
                            .padding(.leading, 25)
                        Spacer()
                    }
                    //NewsView
                    NewsView()
           
                    
                    HStack{
                        Text("Каталог Анализов")
                            .foregroundColor(.gray)
                            .padding(.leading, 25)
                        Spacer()
                    }
                    CatalogNewsView()
                    
                }
                
                
                else{
                    ZStack{
                        LinearGradient(colors: [Color("white"),Color("ggg")], startPoint: .top, endPoint: .bottom)
                    }
                }
            }
        }
    }
}
struct SecondScreen: View{
    var body: some View{
        VStack{
            Image("iconApp")
                .resizable()
                .frame(width:50, height:50)
        }
    }
}

struct ThirdScreen: View{
    var body: some View{
        VStack{
            Image("iconApp")
                .resizable()
                .frame(width:50, height:50)
        }
    }
}

struct FourthScreen: View{
    @State var otchestvo = ""
    @State var password = ""
    @State var name = ""
    @State var surname = ""
    @State var data = ""
    @State var pol = ""
    var body: some View{
        VStack{
            Text("Карта пациента")
                .font(.system(size: 25,weight: .bold))
                .foregroundColor(.black)
            ZStack{
                RoundedRectangle(cornerRadius:62)
                    .frame(width:148,height:123)
                    .foregroundColor(Color("gg"))
                Image(systemName: "camera")
                    .resizable()
                    .frame(width:53, height:44)
            }
            Text("Без карты пациента вы не сможете заказать анализы.\nВ картах пациентов будут храниться результаты\nанализов вас и ваших близких")
                .frame(height: 38)
                .font(.system(size: 10))
                .padding(.bottom, 50)
            
            
            if name.isEmpty || surname.isEmpty || pol.isEmpty || data.isEmpty || otchestvo.isEmpty{
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
                Text("Далее")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 335,height: 56)
                    .background(Color("db"))
                    .cornerRadius(12)
                    .opacity(0.5)
                    .padding(.bottom, 150)
                
            }
            else{
                
                ZStack{
                    baza(color1: Color("gggg"), color2: Color("ggg"), height: 48)
                    TextField("Имя", text: $name)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("gggg"), color2: Color("ggg"), height: 48)
                    TextField("Отчество", text: $otchestvo)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("gggg"), color2: Color("ggg"), height: 48)
                    TextField("Фамилия", text: $surname)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("gggg"), color2: Color("ggg"), height: 48)
                    TextField("Дата рождения", text: $data)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                ZStack{
                    baza(color1: Color("gggg"), color2: Color("ggg"), height: 48)
                    TextField("Пол", text: $pol)
                        .frame(width: 325, height: 48)
                        .foregroundColor(.black)
                        .accentColor(.gray)
                }.padding(.bottom, 10)
                NavigationLink(destination:CatalogView()){
                    ZStack{
                        baza(color1: Color("db"), color2: Color("db"), height: 56)
                        Text("Далее")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }.padding(.bottom, 150)
            }
            
            
            
            
        }.navigationBarHidden(true)
        
        
    }
}



struct CatalogView: View {
    var schetchik = 0
    var body: some View {
        ZStack{
            ZStack{
                
            }
            TabView{
                FirstScreen(schetchik: schetchik)
                    .tabItem{
                        Image("Анализы")
                        Text("Анализы")
                    }
                SecondScreen()
                    .tabItem{
                        Image("Результаты")
                        Text("Результаты")
                    }
                ThirdScreen()
                    .tabItem{
                        Image("Поддержка")
                        Text("Поддержка")
                    }
                FourthScreen()
                    .tabItem{
                        Image("Пользователь")
                        Text("Профиль")
                    }
            }
        }.navigationBarHidden(true)
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
