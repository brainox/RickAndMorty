//
//  RMService.swift
//  RickAndMorty
//
//  Created by Obinna Aguwa on 27/01/2023.
//

import Foundation

final class RMService {
    static let shared = RMService()
    private init() {}
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void ) {
        
    }
}
