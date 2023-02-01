//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Obinna Aguwa on 27/01/2023.
//

import Foundation

/// Object that represent a single API call
final class RMRequest {
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endPoint: RMEndpoint
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach { string += "/\($0)"}
        }
        
//        if !pathComponents
        
        return string
    }
    
    public var url: URL? {
        return nil
    }
    
    // MARK: - Public
    public init(
        endPoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}
