//
//  PokemonCollectionViewCell.swift
//  MyPokedex
//
//  Created by Madison Shino on 6/16/21.
//  Copyright © 2021 Madi S. All rights reserved.
//

import UIKit

//Reuse Identifier = "pokemonCell"

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNumberLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var pokemon: Pokemon?
    
}
