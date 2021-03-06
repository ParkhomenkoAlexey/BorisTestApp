//
//  NetworkDataFetcher.swift
//  BorisTestApp
//
//  Created by Пархоменко Алексей on 24.10.2020.
//

import Foundation

class NetworkDataFetcher {
    
    let networkService = NetworkService()
    let limit = 20
    var searchText: String = ""
    var offset = 0
    
    func fetchTracks(searchText: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        offset = 0
        self.searchText = searchText
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&limit=\(limit)"
        networkService.request(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let data):
                self?.decodeJSON(type: SearchResponse.self, from: data, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchNextBatch(completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        offset += limit
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&limit=\(limit)&offset=\(offset)"
        networkService.request(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let data):
                self?.decodeJSON(type: SearchResponse.self, from: data, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchImagesFromUnsplash(searchText: String, completion: @escaping (Result<UnspashResponse, Error>) -> Void) {
        let urlString = "https://api.unsplash.com/search/photos?query=\(searchText)"
        networkService.request(urlString: urlString) { [weak self] (result) in
            switch result {
            
            case .success(let data):
                self?.decodeJSON(type: UnspashResponse.self, from: data, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let objects = try JSONDecoder().decode(type.self, from: data)
            completion(.success(objects))
        } catch let jsonError {
            completion(.failure(jsonError))
        }
        
        //        do {
        //            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        //            print(json)
        //        } catch let error {
        //
        //        }
    }
}


