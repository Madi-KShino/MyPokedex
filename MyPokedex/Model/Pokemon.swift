//
//  Pokemon.swift
//  MyPokedex
//
//  Created by Madison Kaori Shino on 6/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation

struct TopPokemonDictionary: Decodable {
    let count: Int
    let results: [MidPokemonDictionary]
}

struct MidPokemonDictionary: Decodable {
    let name: String
    let url: String
}

//1.Get info from the dictionaries
struct Pokemon: Decodable {
    
    //2.Conform to decodable ^
    //(take json data and decode it so we can use/interact with it)
    
    //3.Declare properties for the data being used from the api
    //(names must match exactly to the key in the json - unless renamed)
    //(the arrays of dictionaries must be taken apart in another struct (3.))
    let name: String
    let id: Int
    let abilities: [AbilityDictionaryOne]
    let spritesDictionary: SpritesDictionary
    let types: [TypeDictionary]
    
    //4.Renaming using CodingKeys (optional)
     //(enum CodingKeys must be capitalized, the declared type CodingKey must be singular)
    private enum CodingKeys: String, CodingKey {
         //case ourName = "api_name"
        // case name == case name = "name"
        case name
        case id
        case abilities
        case spritesDictionary = "sprites"
        case types
    }
}

//1.2.
//(name of the ability is within a dict. - break into main dict, then into the ability dict))
struct AbilityDictionaryOne: Decodable {
    
    //3.Declare property we want from the dictionary in api
    //(spelling must be exact)
    let ability: AbilityDicTwo
    
    //1.2.
    struct AbilityDicTwo: Decodable {
        //3.
        let name: String
    }
}

//1.2.
struct SpritesDictionary: Decodable {
    
    //3.
    let image: URL
    
    //4.
    //(enum CodingKeys must be capitalized, the declared type CodingKey must be singular)
    private enum CodingKeys: String, CodingKey {
        //case ourName = "api_name"
        case image = "front_default"
    }
}

struct TypeDictionary: Decodable {
    
    let type: PokemonType
    
    struct PokemonType: Decodable {
        let name: String
    }
}



//Each dictionary must be its own struct.
