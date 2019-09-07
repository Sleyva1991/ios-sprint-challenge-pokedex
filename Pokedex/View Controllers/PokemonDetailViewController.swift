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
        didSet{
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        pokemonSearchBar.delegate = self
        guard let pokemon = pokemon else { return }
        print("fetch \(pokemon)")
    }
    
 
    
    func updateViews() {
        guard isViewLoaded else { return }
        guard let pokemon = pokemon else { self.nameLabel.text = ""
            return
        }
        
        nameLabel.text = pokemon.name
        idLabel.text = String(pokemon.id)
        let typeString = pokemon.types.map({$0.type.name.capitalized}).joined(separator: ",")
        typeLabel.text = "Type: \(typeString)"
        let abilityString = pokemon.abilities.map({$0.ability.name.capitalized}).joined(separator: ",")
        abilitiesLabel.text = "Abilities: \(abilityString)"
        
        self.pokedexController?.getImage(at: pokemon.sprites.frontDefault, completion: { (image) in
            DispatchQueue.main.async {
                self.pokemonImageView.image = image
            }
        })
        
        
    }
    
    @IBAction func savePokemonTapped(_ sender: Any) {
        guard let pokemon = pokemon else { return }
        pokedexController?.pokedex.append(pokemon)
       self.navigationController?.popViewController(animated: true)
        
    }
}

extension PokemonDetailViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchterm = pokemonSearchBar.text else { return }
        
        pokedexController?.searchForPokemon(searchterm: searchterm, completion: { (result) in
            guard let pokemon = try? result?.get() else { return }
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        })
    }
}


