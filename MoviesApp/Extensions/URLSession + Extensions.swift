//
//  URLSession + Extensions.swift
//  MoviesApp
//
//  Created by iOSayed on 05/03/2023.
//

import Foundation

extension URLSession {
    
    enum CustomNetworkError :Error{
        case invalidUrl
        case invalidData
    }

    func request<T:Codable>(url:URL?,
                            expecting:T.Type,
                            completion:@escaping (Swift.Result<T,Error>) -> Void
    ){
        guard let url = url else{
            completion(.failure(CustomNetworkError.invalidUrl))
            return
        }
        
        
        let task = dataTask(with: url) { data, _, error in
            guard let data = data else{
                if let error = error {
                    completion(.failure(error))
                }else{
                    completion(.failure(CustomNetworkError.invalidData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }catch {
                completion(.failure(error))
            }
        
        }
        task.resume()
    }
}
