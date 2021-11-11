//
//  Extensions.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/10/21.
//

import Foundation
import SwiftUI

extension Text {
    func roundedAndColorStyle(color: Color) -> some View {
        self.font(.subheadline)
            .padding(.trailing)
            .padding(.leading)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
    
    func styleByAnimeType(animeType: String) -> some View {
        self.font(.subheadline)
            .padding(.trailing)
            .padding(.leading)
            .background(animeType == "TV" ? Color.purple : animeType == "Movie" ? Color.yellow : animeType == "Special" ? Color.orange : Color.pink)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
    
}

extension String {
    
    func toDate() -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        return dateFormatter.date(from: self)!
        
    }
    
    func toDateFromSpecialDate() -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y"
        return dateFormatter.date(from: self)!
        
    }
    
}

extension Double {
    
    func toString(places: Int) -> String {
        let multiplier = pow(10, Double(places))
        return String(Darwin.round(self * multiplier) / multiplier)
    }
    
}


extension Date {
    
    func addDays(days: Int) -> Date {
        
        var dateComponent = DateComponents()
        dateComponent.day = days
        return Calendar.current.date(byAdding: dateComponent, to: self)!
        
    }
    
    func toString(shortFormat: Bool) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = shortFormat ? "yyyy'-'MM'-'dd" : "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        return dateFormatter.string(from: self)
    
    }
    
}
