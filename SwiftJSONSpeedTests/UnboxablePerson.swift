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
   init(unboxer: Unboxer) {
      firstname = unboxer.unbox("first")
      lastname = unboxer.unbox("last")
      id = unboxer.unbox("registered")
   }
}


extension PersonList: Unboxable {
   init(unboxer: Unboxer) {
      self.persons = unboxer.unbox("people")
   }
}

extension ComplexPerson: Unboxable {
   init(unboxer: Unboxer) {
      firstname = unboxer.unbox("name.first", isKeyPath: true)
      lastname = unboxer.unbox("name.last", isKeyPath: true)
      id = unboxer.unbox("registerDetails.id", isKeyPath: true)
   }
}