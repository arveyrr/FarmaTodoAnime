//
//  Anime.swift
//  FarmaTodoAnime
//
//  Created by Arvey Rodríguez on 11/10/21.
//

import Foundation

public struct Anime: Codable {
    
    public var mal_id: Int
    public var title: String
    public var image_url: String
    public var type: String
    public var episodes: Int
    public var start_date: Date
    public var end_date: Date
    public var score: Double
    public var synopsis: String
    public var airing_start: Date
    public var origin: AnimeOrigin
    
}

public enum AnimeOrigin: String, Codable {
    case top
    case later
    case search
}
