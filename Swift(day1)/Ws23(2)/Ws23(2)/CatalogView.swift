//
//  CatalogView.swift
//  Ws23(2)
//
//  Created by admin on 15.03.2023.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI
struct News: Codable, Hashable{
    var id: Int
    var name: String
    var price: String
    var image: String
    var description: String
}
struct Catalog: Codable, Hashable{
    var id: Int
    var name: String
    var description: String
    var price: String
    var category: String
    var time_result: String
    var preparation: String
    var bio: String
}


struct FirstScreen: View{
    @State var search = "Искать анализы"
    @State var changed1 = true
    @State var news_item: [News] = []
    @State var catalog_item: [Catalog] = []
    
    var body: some View{
        ZStack{
            LinearGradient(colors: [Color("white"), Color("ggg")], startPoint: .top, endPoint: .bottom)
            
            
            
            if changed1 == true && search != ""{
                VStack{
                    TextField("", text: $search, onEditingChanged: {
                        (changed) in
                        self.changed1.toggle()
                        print("Username onEditingChanged \(changed)")
                    })
                    .foregroundColor(Color("ggg"))
                    .frame(width:335 ,height:48)
                    .padding(2)
                    .background(Color("gg"))
                    .cornerRadius(9)
                    
                    Text("Акции и Новости")
                        .foregroundColor(.gray)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(news_item, id:\.self) { item in
                                ZStack{
                                    
                                    WebImage(url: URL(string: item.image.replacingOccurrences(of: " ",
                                                                                              with: "%20")))
                                    .resizable()
                                    .frame(width: 200, height: 130)
                                    .padding(.leading, 100)
                                    .padding(.top, 15)
                                    VStack(alignment: .leading){
                                        Text(item.name)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(.system(size: 15))
                                            .padding(.top, 20)
                                        
                                        Spacer()
                                        Text(item.description)
                                            .foregroundColor(.black)
                                            .font(.system(size: 13))
                                        Text(item.price)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(.system(size: 15))
                                            .padding(.bottom, 20)
                                    }.padding(.trailing, 100)
                                    
                                    
                                }.frame(width:270 ,height:152)
                                    .background(item.id % 2 == 0 ?
                                                LinearGradient(gradient: Gradient(colors:[Color("gr2"), Color("lb")]), startPoint: .leading, endPoint: .trailing):LinearGradient(gradient: Gradient(colors:
                                                                                                                                                                                                        [Color("nnnb"), Color("nnnb1")]), startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(20)
                            }
                        }
                        
                        
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            Text("1")
                            Text("1")
                            Text("1")
                            Text("1")
                            Text("1")
                            Text("1")
                            Text("1")
                            Text("1")
                            Text("1")
                            
                        }
                    }
                    ScrollView(.vertical, showsIndicators: false){
                        VStack{
                            ForEach(catalog_item, id:\.self) { item in
                                ZStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.white)
                                        .frame(width:335 ,height:136)
                                    VStack(alignment: .leading){
                                        Text(item.name)
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                        VStack{
                                            Text(item.time_result)
                                                .foregroundColor(.gray)
                                            Text("\(item.price)$")
                                                .foregroundColor(.black)
                                        }
                                        
                                            
                                        
                                    }
                                    
                                    
                                }.frame(width:270 ,height:152)
                                    .cornerRadius(20)
                            }
                        }
                    }
                }
            }
            else{
                VStack{
                    TextField("", text: $search, onEditingChanged: {
                        (changed) in
                        self.changed1.toggle()
                        print("Username onEditingChanged \(changed)")
                    })
                    .foregroundColor(Color("ggg"))
                    .frame(width:335 ,height:48)
                    .padding(2)
                    .background(Color("gg"))
                    .cornerRadius(9)
                }
            }
        }.onAppear{
            AF.request("https://medic.madskill.ru/api/news")
                .responseDecodable(of: [News].self) { item in
                    if case .success = item.result {
                        print("yes")
                        self.news_item = item.value!
                        
                    }
                }
            
            //            else{
            //                TextField("", text: $search)
            //                    .foregroundColor(Color("ggg"))
            //                    .frame(width:335 ,height:48)
            //                    .padding(2)
            //                    .background(Color("gg"))
            //                    .cornerRadius(9)
            //            }
        }.onAppear{
            AF.request("https://medic.madskill.ru/api/catalog")
                .responseDecodable(of: [Catalog].self) { item in
                    if case .success = item.result {
                        print("yes")
                        self.catalog_item = item.value!
                        
                    }
                }
        }
    }
}
    
struct SecondScren: View{
    var body: some View{
        Text("2")
    }
}
struct ThirdScreen: View{
    var body: some View{
        Text("3")
    }
}
struct FourthScreen: View{
    var body: some View{
        Text("4")
    }
}
struct CatalogView: View {
    var body: some View {
        TabView{
            FirstScreen()
                .tabItem{
                Image("Анализы")
                Text("Анализы")
                    .foregroundColor(Color("gg2"))
            }
            SecondScren()
                .tabItem{
                Image("Результаты")
                Text("Результаты")
                    .foregroundColor(Color("gg2"))
            }
            ThirdScreen()
                .tabItem{
                Image("Поддержка")
                Text("Поддержка")
                    .foregroundColor(Color("gg2"))
            }
            FourthScreen()
                .tabItem{
                Image("Пользователь")
                Text("Профиль")
                    .foregroundColor(Color("gg2"))
            }
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
