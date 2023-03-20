//
//  CatalogNewsView.swift
//  WS23(Sessions)
//
//  Created by admin on 16.03.2023.
//

import SwiftUI

struct ll2: View{
    @ObservedObject var catalogViewModel = CatalogNewsViewModel2()
    @State var showSheetView = false
    @State var buttonEdit = false
    @State var isActive = false
    var category: String
    var body: some View{
        VStack{
        ScrollView(.vertical, showsIndicators: false){
            
            VStack{
//                фильтрация массива по категории
                let filtered = catalogViewModel.items2.filter{ $0.category.contains(category) }
//               вывод отфильтрованного массива
                ForEach(filtered, id:\.self){ item2 in
                    Button(action:{
                        self.showSheetView.toggle()
                        catalogViewModel.myCount(item2: item2)
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 335, height: 136)
                                .foregroundColor(.white)
                            VStack{
                                Text(item2.name)
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 70)
                                HStack{
                                    VStack{
                                        Text(item2.time_result)
                                            .foregroundColor(Color("gray"))
                                        Text(item2.price)
                                            .foregroundColor(.black)
                                    }.padding(.leading, 40)
                                    Spacer()
                                    
                                    Button(action:{
                                        if buttonEdit {
                                            catalogViewModel.myMinus(item2: item2)
                                        }
                                        else
                                        {
                                            catalogViewModel.myCount(item2: item2)
                                        }
                                        self.buttonEdit.toggle()
                                        
                                        
                                    }){
                                        ZStack{
                                            RoundedRectangle(cornerRadius:8)
                                                .frame(width:100, height:45)
                                                .foregroundColor(buttonEdit ?  Color("white") : Color("db"))
                                                .padding(1)
                                                .background(Color("db"))
                                                .cornerRadius(8)
                                            Text(buttonEdit ? "Убрать" : "Добавить")
                                            .foregroundColor(buttonEdit ?  Color("db") : Color("white"))}
                                    }.padding(.trailing, 40)
                                }
                            }
                            
                        }.sheet(isPresented:$showSheetView){
                            //                            !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                            SheetView(item2: catalogViewModel.itemm!)
                        }
                    }
                }
                
            }
        }
                Button(action:{self.isActive = true}){
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width:335 , height:56)
                        HStack{
                            Image("kalaska")
                                .resizable()
                                .frame(width: 10,height: 10)
                            Text("В корзину")
                                .foregroundColor(.white)
                            Text("\(catalogViewModel.schetchik)$")
                                .foregroundColor(.white)
                        }
                    }
                }
            
            
        } .onAppear{
            catalogViewModel.catalogRequest()
        }
        
    }
}

struct ButtonIcon: View{
    var button: ButtonData
    var tap: Int
    var body: some View{
        if tap == 1 {
            ZStack{
                RoundedRectangle(cornerRadius: 9)
                    .foregroundColor(Color("db"))
                    .frame(height:48)
                Text(button.name)
                    .foregroundColor(Color("white"))
                    .padding(.horizontal, 10)
            }
        }
        else{
            ZStack{
                RoundedRectangle(cornerRadius: 9)
                    .foregroundColor(Color("ggg"))
                    .frame(height:48)
                Text(button.name)
                    .foregroundColor(Color("gray"))
                    .padding(.horizontal, 10)
            }
        }
    }
}

struct ButtonData: Identifiable{
    let id = UUID()
    let id2: Int
    let name: String
}

struct CatalogNewsView: View {
    @State var buttons = [
        ButtonData(id2: 0, name: "Популярные"),
        ButtonData(id2: 1, name: "Covid"),
        ButtonData(id2: 2, name: "Комплексные")
    ]
               
    @State var buttonsTap: [Int] = [1, 0, 0]
    @State var activeButton: Int  = 0
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                Button(action:{ buttonsFalse(i: 0)}){
                            ButtonIcon(button: buttons[0], tap: buttonsTap[0])
                        }
                Button(action:{ buttonsFalse(i: 1)}){
                        ButtonIcon(button: buttons[1], tap: buttonsTap[1])
                    }
                Button(action:{ buttonsFalse(i: 2)}){
                        ButtonIcon(button: buttons[2], tap: buttonsTap[2])
                    }
                }
                
//                    icon(color1: "db", text1: "Популярные", color2: "white")//, width: 140)
//                    icon(color1: "ggg", text1: "Covid", color2: "gray")//, width: 100)
//                    icon(color1: "ggg", text1: "Комплексные", color2: "gray", width: 154)
//                    icon(color1: "ggg", text1: "Чекапы", color2: "gray", width: 100)
//                    icon(color1: "ggg", text1: "Биохимия", color2: "gray", width: 110)
//                    icon(color1: "ggg", text1: "Гормоны", color2: "gray", width: 120)
//                }
//                Group{
//                    icon(color1: "ggg", text1: "Иммунитет", color2: "gray", width: 100)
//                    icon(color1: "ggg", text1: "Витамины", color2: "gray", width: 105)
//                    icon(color1: "ggg", text1: "Аллергены", color2: "gray", width: 105)
//                    icon(color1: "ggg", text1: "Анализ крови", color2: "gray", width: 150)
//                }
//            }
            
        }.padding(.leading, 23)
        ZStack{
           
            ll2( category: buttons[activeButton].name)
                
            
            
        }
    }
    func buttonsFalse(i: Int){
      for var item in  buttonsTap{
            item = 0
        }
        activeButton = i
        buttonsTap[i] = 1
        print(buttons[activeButton].name )
    }
}

struct CatalogNewsView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogNewsView()
    }
}
