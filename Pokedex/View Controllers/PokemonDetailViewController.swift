//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Steven Leyva on 9/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    
    var pokedexController: PokedexController?
    
    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        guard let pokemon = pokemon else { return }
        
        nameLabel.text = pokemon.name
        idLabel.text = "ID: \(pokemon.id)"
        typeLabel.text = "Type: \(pokemon.type)"
        abilitiesLabel.text = "Abilities: \(pokemon.abilities)"
    }
    
    @IBAction func savePokemonButton(_ sender: Any) {
        guard let title = nameLabel.text, !title.isEmpty else { return }
        navigationController?.popViewController(animated: true)
    }
}

extension PokemonDetailViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchterm = pokemonSearchBar.text else { return }
        
        pokedexController?.searchForPokemon(searchterm: searchterm, completion: { (error) in
            if let error = error {
                print("Search term not found: \(error)")
            }
        })
    }
}
