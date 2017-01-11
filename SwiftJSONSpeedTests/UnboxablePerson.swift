//
//  UnboxablePerson.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import UIKit
import Unbox

extension Person: Unboxable {
   init(unboxer: Unboxer) throws {
      firstname = try unboxer.unbox(key: "first")
      lastname = try unboxer.unbox(key: "last")
      id = try unboxer.unbox(key: "registered")
   }
}


extension PersonList: Unboxable {
   init(unboxer: Unboxer) throws {
      self.persons = try unboxer.unbox(key: "people")
   }
}

extension ComplexPerson: Unboxable {
   init(unboxer: Unboxer) throws {
      firstname = try unboxer.unbox(keyPath: "name.first")
      lastname = try unboxer.unbox(keyPath: "name.last")
      id = try unboxer.unbox(keyPath: "registerDetails.id")
   }
}
