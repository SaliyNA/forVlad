//
//  NewsView.swift
//  WS23(Sessions)
//
//  Created by admin on 16.03.2023.
//

import SwiftUI
import SDWebImageSwiftUI


struct NewsView: View {
    @ObservedObject var newsViewModel = NewsViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(newsViewModel.items, id:\.self){ item in
                    ZStack{
                        WebImage(url: URL(string: item.image.replacingOccurrences(of: " ",
                                                                                  with: "%20")))
                        .resizable()
                        .frame(width: 200, height: 130)
                        .padding(.leading, 80)
                        .padding(.top, 15)
                        VStack(alignment: .leading){
                            Text(item.name)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 15))
                                .padding(.top, 20)
                            
                            Spacer()
                            Text(item.description)
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                            Text(item.price)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 15))
                                .padding(.bottom, 20)
                        }.padding(.trailing, 100)
                        
                        
                    }.frame(width:270 ,height:152)
                        
                        .background(item.id % 2 == 0 ?
                                                                    LinearGradient(gradient: Gradient(colors:
                        [Color("gr2"), Color("lb")]), startPoint: .leading, endPoint: .trailing)
                                                                    :
                                                                        LinearGradient(gradient: Gradient(colors:
                        [Color("nnnb"), Color("nnnb1")]), startPoint: .leading, endPoint: .trailing)
                                                        )
                        .cornerRadius(20)
                        
                }
            }
        }.frame(height: 152)
            .padding(.leading, 20)
            .onAppear{
                newsViewModel.requestNews()
            }
            
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
