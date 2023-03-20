//
//  ButtonCircle.swift
//  WS23(Sessions)
//
//  Created by admin on 03.03.2023.
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
                .background(Color("ggg"))
                .cornerRadius(40)
                .font(.system(size: 20, weight: .bold))
//                .bold
        }
    }
}

