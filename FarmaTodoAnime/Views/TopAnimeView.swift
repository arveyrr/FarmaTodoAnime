//
//  TopAnimeView.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopAnimeView: View {
    
    @ObservedObject var animeAPI = AnimeAPI()
    
    
    init() {
        self.animeAPI.getTop()
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 50) {
                    
                    ForEach(self.animeAPI.listTop, id: \.mal_id) { item in
                        GeometryReader { proxy in
                            NavigationLink(destination: AnimeDetailView(anime: item)) {
                                let scale = getScale(proxy: proxy)
                                
                                AnimatedImage(url: URL(string: item.image_url))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                    )
                                    .clipped()
                                    .cornerRadius(5)
                                    .shadow(radius: 5)
                                    .scaleEffect(CGSize(width: scale, height: scale))
                                    .animation(.easeOut(duration: 0.5))
                            }
                        }
                        .frame(width: 125, height: 200)
                            
                    }
                    
                }.padding(32)
            }
        }
    }
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        
        let diff = abs(x - 32)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        
        return scale
    }
    
    
}

struct TopAnimeView_Previews: PreviewProvider {
    static var previews: some View {
        TopAnimeView()
    }
}
