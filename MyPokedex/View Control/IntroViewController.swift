//
//  IntroViewController.swift
//  MyPokedex
//
//  Created by Madison Shino on 6/16/21.
//  Copyright © 2021 Madi S. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet weak var pokedexButton: UIButton!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
    }
    
    func setImage() {
        let pokemonImageNames = ["bulb", "jiggly", "moltres", "oddish", "raichu", "trapinch"]
        if let imageName = pokemonImageNames.randomElement() {
            pokemonImageView.image = UIImage(named: imageName)
        } else {
            pokemonImageView.image = UIImage(named: "poke")
        }
    }
}
