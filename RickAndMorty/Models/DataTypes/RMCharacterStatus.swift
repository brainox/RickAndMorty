//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Obinna Aguwa on 31/01/2023.
//

import Foundation


enum RMCharacterStatus: String, Codable {
    case Alive = "Alive"
    case Dead = "Dead"
    case `unknown` = "unknown"
    
    var text : String {
        switch self {
        case .Alive, .Dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
