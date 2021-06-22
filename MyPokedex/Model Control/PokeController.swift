//
//  PokeController.swift
//  MyPokedex
//
//  Created by Madison Shino on 6/17/21.
//  Copyright © 2021 Madi S. All rights reserved.
//

import Foundation
import CoreData

class PokeController {
    
    static let shared = PokeController()
    
    var fetchedResultsController: NSFetchedResultsController<Poke>
    
    init() {
        let request: NSFetchRequest<Poke> = Poke.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        let resultsController: NSFetchedResultsController<Poke> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.managedObjectContext, sectionNameKeyPath: "id", cacheName: nil)
        fetchedResultsController = resultsController
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Error performing the fetch request")
        }
    }
    
    //MARK: Crud Functions
    
    func addPokeWith(name: String) {
        _ = Poke(name: name)
        saveToPersistentStore()
    }
    
    func save(pokemon: Poke) {
        saveToPersistentStore()
    }
    
    func update(pokemon: Poke, id: Int, photoData: String, abilities: Set<Ability>, type: Set<PokeType>) {
        pokemon.id = Int16(id)
        pokemon.photoData = photoData
        pokemon.abilities = abilities as NSSet
        pokemon.types = type as NSSet
        saveToPersistentStore()
    }
    
    //MARK: Persistence
    func saveToPersistentStore() {
        do {
            try CoreDataStack.managedObjectContext.save()
        } catch {
            print("Error Saving to Persistent Store", error.localizedDescription)
        }
    }
}
