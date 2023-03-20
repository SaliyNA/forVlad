//
//  Button.swift
//  WS23(Sessions)
//
//  Created by admin on 03.03.2023.
//

import SwiftUI

struct Button: View {
    let text:String
    let action: () -> Void
    var body: some View {
        Button(action: self.action){
            Text(self.text)
                .foregroundColor(.black)
                .background(Color("gg"))
                .cornerRadius(20)
        }
    }
}
