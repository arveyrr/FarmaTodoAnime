//
//  RowView.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/11/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct RowView: View {
    
    let item: Anime
    var imageHeight = CGFloat(100)
    
    var body: some View {
        NavigationLink(destination: AnimeDetailView(anime: item)) {
            HStack(spacing: 10) {
                
                AnimatedImage(url: URL(string: item.image_url))
                    .resizable()
                    .frame(width: imageHeight * 0.75, height: imageHeight)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 6.0))
                    .shadow(radius: 6)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack {
                        Text(item.type)
                            .styleByAnimeType(animeType: item.type)
                        
                        if (Utils.isOnline(anime: item)) {
                            Text("OnLine")
                                .roundedAndColorStyle(color: .green)
                        }
                    }
                    
                    Text(item.title)
                        .font(.title2).bold()
                    
                    Text("Episodes: \(item.episodes)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
                
            }.padding(.vertical)
        }
    }
    
}
