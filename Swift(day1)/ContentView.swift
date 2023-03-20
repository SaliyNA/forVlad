//
//  ContentView.swift
//  Swift(day1)
//
//  Created by admin on 12.02.2023.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        Text("Первый экран")
    }
}

struct SecondView: View {
    var body: some View {
        Text("Второй экран")
    }
}
struct ThirdView: View {
    var body: some View {
        Text("Третий экран")
    }
}
struct FourView: View {
    var body: some View {
        Text("Четвертый экран")
    }
}
struct FifthView: View {
    var body: some View {
        ZStack{
            
            
                    
                Form{
                   
                    Section(header: Text("О приложении")){
                        HStack{
                            Text("Version")
                        }
                    }
                }
            VStack{
                HStack{
                    NavigationLink(destination:MainView()){
                        HStack{
                            Image(systemName: "arrow.left")
                            Text("Settings")
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
            
            
        }.navigationBarHidden(true)
    }
}
struct SixthView: View {
    var body: some View {
        Text("Шестой экран")
    }
}
struct SeventhView: View {
    var body: some View {
        Text("Седьмой экран")
    }
}


struct MyFormRow: View{
    var img: String
    var color: Color
    var text: String
    var body: some View{
        HStack{
            Image(systemName: img)
                .padding(10)
                .background(color)
                .cornerRadius(10)
            Text(text)
        }
    }
}

struct MainView: View {
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Приложение")){
                    NavigationLink(destination: FirstView()){
                        MyFormRow(img: "person.fill", color: .red, text: "Внешний вид")
                        }
                    
                    NavigationLink(destination: SecondView()){
                        MyFormRow(img: "globe", color: .yellow, text: "Язык")
                    }
                }
                Section(header: Text("Тех.Поддержка")){
                    NavigationLink(destination: ThirdView()){
                        HStack{
                            Image(systemName: "person.circle")
                            Text("Написать отзыв")
                        }
                    }
                    NavigationLink(destination: FourView()){
                        HStack{
                            Image(systemName: "circle")
                            Text("Связаться с разработчиком")
                        }
                    }
                    NavigationLink(destination: FifthView()){
                        HStack{
                            Image(systemName: "star")
                            Text("О приложении")
                        }
                    }
                    
                }
            }.navigationTitle("Настройки")
                
        }.navigationBarHidden(true)
    }
}


struct ContentView: View {
    var body: some View {
        
            TabView{
                MainView()
                    .tabItem{
                        Image(systemName: "house.fill")
                        Text("Новости")
                    }
                FirstView()
                    .tabItem{
                        Image(systemName: "2.circle")
                        Text("Оценки")
                    }
                SecondView()
                    .tabItem{
                        Image(systemName: "clock")
                        Text("Расписание")
                    }
                ThirdView()
                    .tabItem{
                        Image(systemName: "4.circle")
                        Text("Поиск")
                    }
                FourView()
                    .tabItem{
                        Image(systemName: "5.circle")
                        Text("Настройки")
                    }
            
            }.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
