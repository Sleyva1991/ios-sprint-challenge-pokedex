//
//  Pokemon.swift
//  Pokedex
//
//  Created by Steven Leyva on 9/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let abilities: [Ability]
    let type: [PokemonType]
    let id: Int
    let name: String
    let sprites: Sprites
}

struct Ability: Codable {
    let ability: AbilityInfo
    
}

struct AbilityInfo: Codable {
    let name: String
    let url: String
    
}

struct Sprites: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonType: Codable {
    let type: Type
}

struct Type: Codable {
    let name: String
    let url: String
}

struct PokedexSearch: Codable {
    let results: [Pokemon]
}
