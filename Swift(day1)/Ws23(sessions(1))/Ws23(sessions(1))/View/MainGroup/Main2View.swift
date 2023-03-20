//
//  Main2.swift
//  Ws23(sessions(1))
//
//  Created by admin on 17.03.2023.
//

import SwiftUI

struct Main2: View {
    @State var isActive = false
    @State var isNext1 = false
    @State var isNext2 = false
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    ZStack{
                        NavigationLink(destination:Main(), isActive: $isNext1){}
                        NavigationLink(destination:Main3(), isActive: $isNext2){}
                        NavigationLink(destination:AuthView(), isActive: $isActive){}
                        Button(action:{
                            isActive = true
                        }){
                            Text("Пропустить")
                        }
                    }.padding(.trailing, 90)
                        .padding(.bottom, 130)
                    
                    Image("PlusIcon")
                }
                Spacer()
                Text("Уведомления")
                    .fontWeight(.medium)
                    .foregroundColor(Color("Grengroocer"))
                Text("Вы быстро узнаете о результатах")
                HStack{
                    Button(action:{
                        isNext1 = true
                    }){Image("EmptyCircle")
                            .resizable()
                    }.frame(width: 12, height: 12)
                    Button(action:{
                        
                    }){Image("FullCircle")
                            .resizable()
                    }.frame(width: 12, height: 12)
                    Button(action:{
                        isNext2 = true
                    }){Image("EmptyCircle")
                            .resizable()
                    }.frame(width: 12, height: 12)
                }
            Spacer()
                Image("med2")
                    .padding(.bottom, 50)
            }
            
        }.navigationBarHidden(true)
    }
}

struct Main2_Previews: PreviewProvider {
    static var previews: some View {
        Main2()
    }
}
