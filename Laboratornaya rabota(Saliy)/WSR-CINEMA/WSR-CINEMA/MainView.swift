//
//  MainView.swift
//  WSR-CINEMA
//
//  Created by admin on 21.02.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            Color("purp")
                .edgesIgnoringSafeArea(.all)
        }.navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
