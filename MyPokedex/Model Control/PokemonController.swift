//
//  PokemonController.swift
//  MyPokedex
//
//  Created by Madison Kaori Shino on 6/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import UIKit

class PokemonController {
    
    //Singleton - allow access to the items on this class
    static let sharedInstance = PokemonController()
    
    //Create
    //Method signature - begin to access the data from the url to create pokemon!
    func fetchPokemonWith(searchTerm: String, completion: @escaping((Pokemon?) -> Void)) {
        
        //1.Build the base URL (unwrap if needed)
        let baseUrl = URL(string: "https://pokeapi.co/api/v2/")
        
        //2. construct the final url (ex: appending anything to the url)
        //(add /pokemon, add /searchTerm)
        let pokemonPathComponentURL = baseUrl?.appendingPathComponent("pokemon")
        guard let finalURL = pokemonPathComponentURL?.appendingPathComponent(searchTerm) else { return }
        
        //3. create a url request to get data from
        //        let request = URLRequest(url: url)
        
        //4. get the data from the url request
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            //handle the error
            if let error = error {
                print("There was an error \(error.localizedDescription)")
            }
            //check if there is data
            if let data = data {
                do {
                    //decode the data into an object we can use
                    //handle the data
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    completion(pokemon)
                } catch {
                    print("Error fetching pokemon!")
                    completion(nil); return
                }
            }
        } .resume()
    }
    
    func fetchAllPokemon(completion: @escaping(([MidPokemonDictionary]) -> Void)) {
        
        //1.Build the base URL (unwrap if needed)
        let baseUrl = URL(string: "https://pokeapi.co/api/v2/")
        
        //2. construct the final url (ex: appending anything to the url)
        //(add /pokemon, add /searchTerm)
        guard let pokemonPathComponentURL = baseUrl?.appendingPathComponent("pokemon") else { completion([]); return }
        
        //3. create a url request to get data from
        //        let request = URLRequest(url: url)
        
        //4. get the data from the url request
        URLSession.shared.dataTask(with: pokemonPathComponentURL) { (data, result, error) in
            //handle the error
            if let error = error {
                print("There was an error \(error.localizedDescription)")
            }
            //check if there is data
            if let data = data {
                do {
                    //decode the data into an object we can use
                    //handle the data
                    let pokemonArray = try JSONDecoder().decode(TopPokemonDictionary.self, from: data)
                    completion(pokemonArray.results)
                } catch {
                    print("Error decoding pokemon!")
                    completion([]); return
                }
            }
        } .resume()
    }
    
    func fetchPokeImage(pokemon: Pokemon, completion: @escaping (UIImage?) -> Void) {
        // Build URL
        let imageURL = pokemon.spritesDictionary.image
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            if let error = error {
                print("Error with image \(error.localizedDescription)")
            }
            if let data = data {
                guard let pokeImage = UIImage(data: data) else { completion(nil); return }
                completion(pokeImage)
            }
        } .resume()
    }
}

//background thread
//need to know when work in background is done - completion allows to run code when something is done

//optionals because we arent sure we will get the data we want back from the api
//return void so if we dont get that specific data, we choose to get nothing.

//@escaping
