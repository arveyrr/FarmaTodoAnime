//
//  SeasonLaterView.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct LaterView: View {
    
    @ObservedObject var animeAPI = AnimeAPI()
    
    init() {
        self.animeAPI.getLater(weekDay: Utils.getCurrentDayName())
    }
    
    var body: some View {
        VStack {
            
            if (self.animeAPI.listLater.count > 0) {
                
                Divider()
                
                Text("Season Later")
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            List(self.animeAPI.listLater, id: \.mal_id) { item in
                
                RowView(item: item)
                
            }.listStyle(PlainListStyle())
            
        }
    }
    
    
}


struct LaterView_Previews: PreviewProvider {
    static var previews: some View {
        LaterView()
    }
}
