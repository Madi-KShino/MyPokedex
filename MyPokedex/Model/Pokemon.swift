//
//  Pokemon.swift
//  MyPokedex
//
//  Created by Madison Kaori Shino on 6/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation

//1.Get info from the dictionaries
struct TopLevelDictionary: Decodable {
    
    //2.Conform to decodable ^
    //(take json data and decode it so we can use/interact with it)
    
    //3.Declare properties for the data being used from the api
    //(names must match exactly to the key in the json - unless renamed)
    //(the arrays of dictionaries must be taken apart in another struct (3.))
    let name: String
    let id: Int
    let abilities: [AbilityDictionary]
    let spritesDictionary: SpritesDictionary
    
    //4.Renaming using CodingKeys (optional)
     //(enum CodingKeys must be capitalized, the declared type CodingKey must be singular)
    private enum CodingKeys: String, CodingKey {
         //case ourName = "api_name"
        // case name == case name = "name"
        case name
        case id
        case abilities
        case spritesDictionary = "sprites"
    }
}

//1.2.
//(name of the ability is within a dict. - break into main dict, then into the ability dict))
struct AbilityDictionary: Decodable {
    
    //3.Declare property we want from the dictionary in api
    //(spelling must be exact)
    let ability: Ability
    
    //1.2.
    struct Ability: Decodable {
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
        case image = "front_shiny"
    }
}



//Each dictionary must be its own struct.
