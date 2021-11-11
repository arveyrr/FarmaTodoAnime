//
//  SearchBar.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/10/21.
//

import Foundation
import SwiftUI

struct SearchBar : UIViewRepresentable {
    
    let placeHolder: String
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: self.$text)
    }
    
    @Binding var text : String
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        
        searchBar.placeholder = placeHolder
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text : String
        
        init(text: Binding<String>){
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.searchBarAux(_:)), object: searchBar)
                perform(#selector(self.searchBarAux(_:)), with: searchBar, afterDelay: 0.5)
            
            
        }
        
        @objc func searchBarAux(_ searchBar: UISearchBar) {
            
            text = searchBar.text ?? ""
            
        }
        
    }
    
    
}
