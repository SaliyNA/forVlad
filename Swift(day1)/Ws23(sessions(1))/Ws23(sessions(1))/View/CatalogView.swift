//
//  CatalogView.swift
//  Ws23(sessions(1))
//
//  Created by admin on 20.03.2023.
//

import SwiftUI

struct CatalogView: View {
    @State var search = ""
    @State var isActive = false
    var body: some View {
        VStack{
            TextField("Искать анализы", text: $search)
            Text("Акции и новости")
                .foregroundColor(.gray)
                .padding(.trailing, 200)
            NewsView()
            Text("1")
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
