//
//  AnimeDetailView.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct AnimeDetailView: View {
    
    
    let anime: Anime
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                
                
                Text(self.anime.title)
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                
                if (Utils.isOnline(anime: self.anime)) {
                    Text("OnLine")
                        .roundedAndColorStyle(color: .green)
                }
                else {
                    Text("OffLine")
                        .roundedAndColorStyle(color: .gray)
                }
                
                AnimatedImage(url: URL(string: self.anime.image_url))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 2)
                
                HStack {
                    Text(self.anime.type)
                        .styleByAnimeType(animeType: self.anime.type)
                    
                    Text("Episodes: \(self.anime.episodes)")
                        .roundedAndColorStyle(color: .orange)
                    
                    Text("Score: \(self.anime.score.toString(places: 2))")
                        .roundedAndColorStyle(color: .yellow)
                    
                }
                
                if (self.anime.origin == .top || self.anime.origin == .search) {
                    
                    Text("\(self.anime.start_date.toString(shortFormat: true)) - \(self.anime.end_date.toString(shortFormat: true))")
                        .roundedAndColorStyle(color: .secondary)
                    
                }
                else if (self.anime.origin == .later) {
                    Text("Airing start: \(self.anime.airing_start.toString(shortFormat: true))")
                        .roundedAndColorStyle(color: .secondary)
                }
                
                Text(self.anime.synopsis)
                
            }
            .padding(.horizontal)
        }
    }
    
    
}

struct AnimeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeDetailView(anime: Anime(mal_id: 1, title: "Title", image_url: "", type: "", episodes: 0, start_date: Date(), end_date: Date(), score: 0, synopsis : "", airing_start : Date(), origin: .top))
    }
}
