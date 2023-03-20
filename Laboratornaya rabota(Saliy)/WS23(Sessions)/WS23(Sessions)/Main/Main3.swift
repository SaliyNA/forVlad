//
//  Main3.swift
//  WS23(Sessions)
//
//  Created by admin on 26.02.2023.
//

import SwiftUI

struct Main3: View {
    var body: some View {
        VStack{
            HStack{
                NavigationLink(destination:Hub()){
                    Text("Завершить")
                }.padding(.leading, 25)
                    .padding(.bottom, 125)
                Spacer()
                Image("icon2")
                    .resizable()
                    .frame(width: 167, height:163)
            }
            Spacer()
            
            
            Text("Мониторинг")
                .fontWeight(.medium)
                .foregroundColor(Color("g"))
                .font(.system(size: 18))
                .padding(.bottom, 20)
            
            
            Text("  Наши врачи всегда наблюдают\nза вашими показателями здоровья")
                .foregroundColor(.gray)
                .font(.system(size: 13))
            
            
            Spacer()
            HStack{
                Image("Ellipse 3")
                    .resizable()
                    .frame(width: 14,height: 14)
                Image("Ellipse 2")
                    .resizable()
                    .frame(width: 14,height: 14)
                Image("Ellipse 1")
                    .resizable()
                    .frame(width: 14,height: 14)
            }
            
            Spacer()
            
            NavigationLink(destination:Hub()){
                Image("3")
                    .resizable()
                    .frame(width: 359, height: 269)
            }
            Spacer()
        }.navigationBarHidden(true)
    }
}

struct Main3_Previews: PreviewProvider {
    static var previews: some View {
        Main3()
    }
}
