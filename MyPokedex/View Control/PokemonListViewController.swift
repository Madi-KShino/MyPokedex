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
    
    var pokemon: [MidPokemonDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPokemon()
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
    }
    
    func getPokemon() {
        PokemonController.sharedInstance.fetchAllPokemon() { (pokemon) in
            self.pokemon = pokemon
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension PokemonListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCollectionViewCell else { return UICollectionViewCell() }
        let pokemon = self.pokemon[indexPath.row]
        var pokeImage: UIImage?
//        cell.pokemon = pokemon[indexPath.row]
//        PokemonController.sharedInstance.fetchPokeImage(pokemon: pokemon, completion: { (image) in
//            DispatchQueue.main.async {
//                pokeImage = image
//            }
//        })
        cell.pokemonNameLabel.text = pokemon.name
//        cell.pokemonImageView.image = pokeImage != nil ? pokeImage : nil
//        cell.pokemonNumberLabel.text = "\(pokemon.id)"
        
        return cell
    }
}
