//
//  PokemonTableViewController.swift
//  Pokedex
//
//  Created by Steven Leyva on 9/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    
    let pokedexController = PokedexController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedexController.pokedex.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
        
        let pokedex = pokedexController.pokedex[indexPath.row]
        cell.textLabel?.text = pokedex.name

        return cell
    }
 
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchSegue" {
            guard let searchVC = segue.destination as? PokemonDetailViewController else { return }
            searchVC.pokedexController = pokedexController
        }
        
        if segue.identifier == "DetailSegue" {
            if let detailVC = segue.destination as? PokemonDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let pokemon = pokedexController.pokedex[indexPath.row]
                detailVC.pokedexController = pokedexController
                detailVC.pokemon = pokemon
            }
        }
     
    }

}
