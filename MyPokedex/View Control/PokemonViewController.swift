//
//  PokemonViewController.swift
//  MyPokedex
//
//  Created by Madison Kaori Shino on 6/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    //Outlets
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var pokeImageVIew: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeIDLabel: UILabel!
    @IBOutlet weak var pokeAbilityLabel: UILabel!
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //How we get info from the search bar
        pokeSearchBar.delegate = self
        let searchBar = UISearchBar()
        searchBar.textField?.textColor = UIColor.white // or whichever color you want
        
    }
    
    func updatesView(pokeball: TopLevelDictionary) {
        DispatchQueue.main.async {
        self.pokeNameLabel.text = pokeball.name.uppercased()
        self.pokeIDLabel.text = "\(pokeball.id)"
        self.pokeAbilityLabel.text = pokeball.abilities[0].ability.name.uppercased()
        }
    }
}

//Make class conform to searchbar protocol through a class extension
extension PokemonViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //call data
        PokemonController.sharedInstance.fetchPokemonWith(searchTerm: searchText) { (pokemon) in
            guard let unwrappedPoke = pokemon else { return }
            PokemonController.sharedInstance.fetchPokeImage(pokemon: unwrappedPoke, completion: { (image) in
                DispatchQueue.main.async {
                    self.pokeImageVIew.image = image
                }
            })
            self.updatesView(pokeball: unwrappedPoke)
        }
    }
}

extension UISearchBar {
    var textField: UITextField? {
        return subviews.first?.subviews.compactMap { $0 as? UITextField }.first
    }
}
