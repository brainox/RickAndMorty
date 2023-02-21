//
//  RMService.swift
//  RickAndMorty
//
//  Created by Obinna Aguwa on 27/01/2023.
//

import Foundation

/// Primary API service to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else{
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let res = try decoder.decode(type.self, from: data)
                completion(.success(res))
//                let json = try JSONSerialization.jsonObject(with: data)
//                print(String(describing: json))
            } catch let err {
                print(err)
            }
        }
        task.resume()
    }
     
    // MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
        
    }
}
