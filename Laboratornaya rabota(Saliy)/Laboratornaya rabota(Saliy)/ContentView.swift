//
//  ContentView.swift
//  Laboratornaya rabota(Saliy)
//
//  Created by admin on 17.02.2023.
//

import SwiftUI

struct Trail: Identifiable{
    var id = UUID()
    var text1: String
    var text2: String
    var image1: String
    var image2: String
}
struct TrailRow: View{
    var trail: Trail
    var body: some View{
        HStack{
            Image(trail.image1)
                .resizable()
                .frame(width: 50,height: 50)
                .cornerRadius(20)
            VStack(alignment: .leading){
                Text(trail.text1)
                Text(trail.text2)
            }
            Image(trail.image2)
                .resizable()
                .frame(width: 40,height: 40)
                .cornerRadius(20)
        }
    }
}

struct Category: Identifiable {
    var id = UUID()
    var title: String
    var trails: [Trail]
}

struct ContentView: View {
    let hikingTrails = [
        Category(title: "Hill", trails: [
        Trail(text1: "Isle Of Skye", text2: "Switzerland", image1: "fon", image2: "Switzerland"),
        Trail(text1: "Steinweg", text2: "Germany", image1: "fon", image2: "Germany"),
        Trail(text1: "Alpine", text2: "Austria", image1: "fon", image2: "Austria")
        ]),
        Category(title: "Castle", trails: [
        Trail(text1: "Neuschwanstein", text2: "Germany", image1: "fon", image2: "Germany"),
        Trail(text1: "Reichstag", text2: "Germany", image1: "fon", image2: "Germany")
    ])
    ]
    var body: some View {
        List{
            ForEach(hikingTrails) { category in
                Section(header: Text(category.title)){
                    ForEach(category.trails){ trail in
                        TrailRow(trail:
                                    trail)
                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
