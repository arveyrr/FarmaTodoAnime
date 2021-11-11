//
//  SearchView.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchView: View {
    
    @ObservedObject var animeAPI = AnimeAPI()
    var searchText: String
    
    init(searchText: String) {
        self.searchText = searchText
        self.animeAPI.search(searchText: searchText)
    }
    
    var body: some View {
        VStack {
            
            if (self.animeAPI.listSearch.count == 0) {
                Text(self.animeAPI.searching ? "Searching '\(self.searchText)'..." : "'\(self.searchText)' not found 😢")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.top, 60)
            }
            
            List(self.animeAPI.listSearch, id: \.mal_id) { item in
                
                RowView(item: item)
                
            }.listStyle(PlainListStyle())
            
        }.padding()
    }
    
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: "")
    }
}
