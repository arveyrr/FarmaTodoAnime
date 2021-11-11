//
//  DataPersistence.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/11/21.
//

import Foundation

public class DataPersistence {
    
    
    static func saveData(data: [Anime], key: String) {
        
        let jsonData = objectToJSONString(from: data)
        
        if (jsonData != "") {
            UserDefaults.standard.set(jsonData, forKey: key)
        }
        
    }
    
    static func getSavedData(key: String) -> [Anime] {
        
        var result = [Anime]()
        
        if (UserDefaults.standard.object(forKey: key) != nil) {
            
            let dataJSON = UserDefaults.standard.object(forKey: key) as! String
            
            let jsonData = dataJSON.data(using: .utf8)!
            result = try! JSONDecoder().decode([Anime].self, from: jsonData)
            
        }
        
        return result
        
    }
    
    static func objectToJSONString(from object: [Anime]) -> String? {
        
        do {
            let jsonData = try JSONEncoder().encode(object)
            return String(data: jsonData, encoding: .utf8)
        }
        catch {
        }
        
        return ""
        
    }
    
}
