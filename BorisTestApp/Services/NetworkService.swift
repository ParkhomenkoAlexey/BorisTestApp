//
//  NetworkService.swift
//  BorisTestApp
//
//  Created by Пархоменко Алексей on 24.10.2020.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            fatalError("can't convert string to url")
        }
    
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return }
                
                completion(.success(data))
            }
        }.resume()
    }
}
