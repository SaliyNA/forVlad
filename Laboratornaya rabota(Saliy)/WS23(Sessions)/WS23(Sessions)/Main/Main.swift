//
//  Main.swift
//  WS23(Sessions)
//
//  Created by admin on 26.02.2023.
//

import SwiftUI

struct Main: View {
    var body: some View {
        VStack{
            HStack{
                NavigationLink(destination:Hub()){
                    Text("Пропустить")
                }.padding(.leading, 25)
                    .padding(.bottom, 125)
                Spacer()
                Image("icon2")
                    .resizable()
                    .frame(width: 167, height:163)
            }
            Spacer()
            
            
            Text("Анализы")
                .fontWeight(.medium)
                .foregroundColor(Color("g"))
                .font(.system(size: 18))
                .padding(.bottom, 20)
            
            
            Text("Экспресс сбор и получение проб")
                .foregroundColor(.gray)
                .font(.system(size: 13))
            
            
            Spacer()
            HStack{
                Image("Ellipse 1")
                    .resizable()
                    .frame(width: 14,height: 14)
                Image("Ellipse 2")
                    .resizable()
                    .frame(width: 14,height: 14)
                Image("Ellipse 3")
                    .resizable()
                    .frame(width: 14,height: 14)
            }
            
            Spacer()
            
            NavigationLink(destination:Main2()){
                Image("1")
                    .resizable()
                    .frame(width: 204, height: 200)
            }
            Spacer()
        }.navigationBarHidden(true)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
