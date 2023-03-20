//
//  ContentView.swift
//  WS23(Sessions)
//
//  Created by admin on 26.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = false
    @State var timerVal: Int = 1
    var body: some View {
            NavigationView{
                
                ZStack{
                    NavigationLink(destination:Main(), isActive: $isActive){}
                    Button(action:{
                        self.isActive = true
                    }){
                        ZStack{
                            LinearGradient(colors: [Color("cb"),Color("db"),Color("ddb"),Color("db"),Color("cb")], startPoint: .bottomLeading, endPoint: .topTrailing)
                                .edgesIgnoringSafeArea(.all)
                            HStack{
                                Text("Смартлаб")
                                    .font(.system(size: 40))
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                Image("icon")
                                    .resizable()
                                    .frame(width: 39, height: 39)
                            }
                        }}
                }.onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
                        if self.timerVal > 0 {self.timerVal -= 1}
                        else{self.isActive = true}
                    }
                }
            }.navigationBarHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
