//
//  Utils.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/11/21.
//

import Foundation

class Utils {
    
    static func getCurrentDayName() -> String {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date).lowercased()
        
    }
    
    static func isOnline(anime: Anime) -> Bool {
        
        var result = false
        
        switch anime.origin {
        case .top, .search:
            
            if (anime.start_date <= Date() && anime.end_date >= Date()) { result = true }

        case .later:
            
            if (anime.airing_start.addDays(days: anime.episodes) >= Date()) { result = true }
            
        }
        
        return result
        
    }
    
}
