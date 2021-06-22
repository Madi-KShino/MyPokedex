//
//  PokemonListViewController.swift
//  MyPokedex
//
//  Created by Madison Shino on 6/16/21.
//  Copyright © 2021 Madi S. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    var pokemonArray: [Poke] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllPokemon()
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
    }
    
    func getAllPokemon() {
        PokemonController.sharedInstance.fetchAllPokemon() { (pokemon) in
            for poke in pokemon {
                let newPokemon = Poke(name: poke.name)
                PokemonController.sharedInstance.fetchPokemonWith(searchTerm: poke.name) { (pokemonDetail) in
                    if pokemonDetail != nil {
                        newPokemon.id = Int16(pokemonDetail!.id)
                        PokemonController.sharedInstance.fetchPokeImage(pokemon: pokemonDetail!) { (image) in
                            if let data = image?.pngData() {
                                let dataString = String(decoding: data, as: UTF8.self)
                                newPokemon.photoData = dataString
                            }
                        }
//                        PokeController.shared.save(pokemon: newPokemon)
                    }
                }
                self.pokemonArray.append(newPokemon)
            }
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
        }
    }
    
    func getPokemonImage() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension PokemonListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCollectionViewCell else { return UICollectionViewCell() }
        let pokemon = self.pokemonArray[indexPath.row]
        var pokeImage: UIImage = UIImage(data: pokemon.photoData)
//        cell.pokemon = pokemon[indexPath.row]
//        PokemonController.sharedInstance.fetchPokeImage(pokemon: pokemon, completion: { (image) in
//            DispatchQueue.main.async {
//                pokeImage = image
//            }
//        })
        cell.pokemonNameLabel.text = pokemon.name
        cell.pokemonImageView.image = pokemon.photoData
        cell.pokemonNumberLabel.text = "\(pokemon.id)"
        
        return cell
    }
}
