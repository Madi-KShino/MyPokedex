//
//  PokeType+Convenience.swift
//  MyPokedex
//
//  Created by Madison Shino on 6/17/21.
//  Copyright © 2021 Madi S. All rights reserved.
//

import Foundation
import CoreData

extension PokeType {
    @discardableResult
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context: context)
        self.name = name
    }
}
