//
//  ContentView.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 12) {
                
                SearchBar(placeHolder: "Search Anime...", text: self.$searchText)
                
                if (self.searchText == "") {
                    
                    TopAnimeView()
                    LaterView()
                    
                }
                else {
                    
                    SearchView(searchText: self.searchText)
                
                }
                
            }.padding()
            .navigationTitle(self.searchText != "" ? "Search anime" : "")
        }.accentColor(.black)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
