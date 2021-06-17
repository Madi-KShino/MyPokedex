//
//  PokemonDetailViewController.swift
//  MyPokedex
//
//  Created by Madison Shino on 6/16/21.
//  Copyright © 2021 Madi S. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var typeStackView: UIStackView!
    @IBOutlet weak var typeOneImage: UIImageView!
    @IBOutlet weak var typeTwoImage: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    func loadUI() {
        guard let pokemon = pokemon else { return }
        nameLabel.text = pokemon.name
        numberLabel.text = "\(pokemon.id)"
        loadTypeImages()
    }
    
    func loadTypeImages() {
        
    }
}
