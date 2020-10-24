//
//  SearchResponse.swift
//  BorisTestApp
//
//  Created by Пархоменко Алексей on 24.10.2020.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var artistName: String
    var collectionName: String
    var artworkUrl60: String?
}
