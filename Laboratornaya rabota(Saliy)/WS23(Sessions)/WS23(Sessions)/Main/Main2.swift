//
//  Main2.swift
//  WS23(Sessions)
//
//  Created by admin on 26.02.2023.
//

import SwiftUI

struct Main2: View {
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
            
            
            Text("Уведомления")
                .fontWeight(.medium)
                .foregroundColor(Color("g"))
                .font(.system(size: 18))
                .padding(.bottom, 20)
            
            
            Text("Вы быстро узнаете о результатах")
                .foregroundColor(.gray)
                .font(.system(size: 13))
            
            
            Spacer()
            HStack{
                Image("Ellipse 2")
                    .resizable()
                    .frame(width: 14,height: 14)
                Image("Ellipse 1")
                    .resizable()
                    .frame(width: 14,height: 14)
                Image("Ellipse 3")
                    .resizable()
                    .frame(width: 14,height: 14)
            }
            
            Spacer()
            
            NavigationLink(destination:Main3()){
                Image("2")
                    .resizable()
                    .frame(width: 366, height: 217)
            }
            Spacer()
        }.navigationBarHidden(true)
    }
}

struct Main2_Previews: PreviewProvider {
    static var previews: some View {
        Main2()
    }
}
