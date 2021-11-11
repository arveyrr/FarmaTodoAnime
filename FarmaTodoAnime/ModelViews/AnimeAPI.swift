//
//  APIConnection.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/10/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class AnimeAPI: ObservableObject {
    
    private let apiUrl = "http://www.nactem.ac.uk/software/acromine/dictionary.py"
    
    @Published var listTop = [Anime]()
    @Published var listLater = [Anime]()
    @Published var listSearch = [Anime]()
    @Published var searching = false
    
    private let keyListTop = "listTop"
    private let keyListLater = "listLater"
    

    func getTop() {
        
        let tempData = DataPersistence.getSavedData(key: self.keyListTop)
        
        if (tempData.count > 0) {
            self.listTop = tempData
            return
        }
        
        AF.request("https://api.jikan.moe/v3/top/anime/1/bypopularity").responseJSON { (response) in
            switch response.result {
            case .success(let value):
                
                self.listTop = [Anime]()
                let json = JSON(value)
                
                for item in json["top"] {
                    
                    let mal_id = item.1["mal_id"].int ?? 0
                    let title = item.1["title"].string ?? ""
                    let image_url = item.1["image_url"].string ?? ""
                    let type = item.1["type"].string ?? ""
                    let episodes = item.1["episodes"].int ?? 0
                    let start_date = ("01 " + (item.1["start_date"].string ?? "Jan 1990")).toDateFromSpecialDate()
                    let end_date = ("01 " + (item.1["end_date"].string ?? "Jan 1990")).toDateFromSpecialDate()
                    let score = item.1["score"].double ?? 0
                    
                    let newItem = Anime(mal_id: mal_id, title: title, image_url: image_url, type: type, episodes: episodes, start_date: start_date, end_date: end_date, score: score, synopsis: "", airing_start: Date(), origin: .top)
                    
                    self.listTop.append(newItem)
                    
                }
                
                DataPersistence.saveData(data: self.listTop, key: self.keyListTop)
                
                break
            case .failure(let error):
                print(error)
                break
            }
            
        }
    }
    
    func getLater(weekDay: String) {
        
        let tempData = DataPersistence.getSavedData(key: self.keyListLater)
        
        if (tempData.count > 0) {
            self.listLater = tempData
            return
        }
        
        AF.request("https://api.jikan.moe/v3/schedule/" + weekDay).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                
                self.listLater = [Anime]()
                let json = JSON(value)
                
                for item in json[weekDay] {
                    
                    let mal_id = item.1["mal_id"].int ?? 0
                    let title = item.1["title"].string ?? ""
                    let image_url = item.1["image_url"].string ?? ""
                    let type = item.1["type"].string ?? ""
                    let episodes = item.1["episodes"].int ?? 0
                    let score = item.1["score"].double ?? 0
                    let synopsis = item.1["synopsis"].string ?? ""
                    let airing_start = (item.1["airing_start"].string ?? "01 Jan 1990").toDate()
                    
                    let newItem = Anime(mal_id: mal_id, title: title, image_url: image_url, type: type, episodes: episodes, start_date: Date(), end_date: Date(), score: score, synopsis: synopsis, airing_start: airing_start, origin: .later)
                    
                    self.listLater.append(newItem)
                    
                }
                
                DataPersistence.saveData(data: self.listLater, key: self.keyListLater)
                
                break
            case .failure(let error):
                print(error)
                break
            }
            
        }
        
    }
    
    func search(searchText: String) {
        
        self.searching = true
        let q = searchText.replacingOccurrences(of: " ", with: "%20")
        
        AF.request("https://api.jikan.moe/v3/search/anime?q=\(q)&page=1").responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                
                self.listSearch = [Anime]()
                let json = JSON(value)
                
                for item in json["results"] {
                    
                    let mal_id = item.1["mal_id"].int ?? 0
                    let title = item.1["title"].string ?? ""
                    let image_url = item.1["image_url"].string ?? ""
                    let type = item.1["type"].string ?? ""
                    let episodes = item.1["episodes"].int ?? 0
                    let score = item.1["score"].double ?? 0
                    let synopsis = item.1["synopsis"].string ?? ""
                    let start_date = (item.1["start_date"].string ?? Date().toString(shortFormat: false)).toDate()
                    let end_date = (item.1["end_date"].string ?? Date().addDays(days: 1).toString(shortFormat: false)).toDate()
                    
                    let newItem = Anime(mal_id: mal_id, title: title, image_url: image_url, type: type, episodes: episodes, start_date: start_date, end_date: end_date, score: score, synopsis: synopsis, airing_start: end_date, origin: .search)
                    
                    self.listSearch.append(newItem)
                    
                }
                
                break
            case .failure(let error):
                print(error)
                break
            }
            
            self.searching.toggle()
            
        }
        
    }
    
    
}
