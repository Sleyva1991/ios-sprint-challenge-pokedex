//
//  Pokemon.swift
//  Pokedex
//
//  Created by Steven Leyva on 9/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

//import Foundation
//
//struct Pokemon: Codable, Equatable {
//    let abilities: [Ability]
//    let types: [PokemonType]
//    let id: Int
//    let name: String
//    let sprites: Sprites
//}
//
//struct Ability: Codable, Equatable {
//    let ability: AbilityInfo
//
//}
//
//struct AbilityInfo: Codable, Equatable {
//    let name: String
//    let url: String
//
//}
//
//struct Sprites: Codable {
//    let frontDefault: String
//
//    enum CodingKeys: String, CodingKey {
//        case frontDefault = "front_default"
//    }
//}
//
//struct PokemonType: Codable, Equatable {
//    let type: Type
//}
//
//struct Type: Codable, Equatable {
//    let name: String
//    let url: String
//}
//
//struct PokedexSearch: Codable, Equatable {
//    let results: [Pokemon]
//}

import Foundation

struct Pokemon: Codable, Equatable {
    let abilities: [Ability]
    let types: [PokemonType]
    let id: Int
    let name: String
    let sprites: Sprites
    
}

struct Ability: Codable, Equatable {
    let ability: AbilityInfo
    
}

struct AbilityInfo: Codable, Equatable {
    let name: String
    let url: String
}

struct Sprites: Codable, Equatable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonType: Codable, Equatable {
    let type: Type
}

struct Type: Codable, Equatable {
    let name: String
    let url: String
}

struct PokedexSearch: Codable, Equatable {
    let results: [Pokemon]
}


