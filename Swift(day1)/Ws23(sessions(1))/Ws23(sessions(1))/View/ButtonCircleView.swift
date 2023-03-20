//
//  ButtonCircleView.swift
//  Ws23(sessions(1))
//
//  Created by admin on 19.03.2023.
//

import SwiftUI

struct ButtonCircle: View {
    let text:String
    let action: () -> Void
    var body: some View {
        Button(action: self.action){
            Text(self.text)
                .frame(width: 80, height: 80)
                .foregroundColor(.black)
                .background(Color("grayy"))
                .cornerRadius(40)
                .font(.system(size: 20, weight: .bold))
//                .bold
        }
    }
}
