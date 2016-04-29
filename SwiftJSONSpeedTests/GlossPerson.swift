//
//  GlossPerson.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import UIKit
import Gloss

extension Person: Decodable {
   init?(json: JSON) {
      guard let firstName: String = "first" <~~ json,
         lastName: String = "last" <~~ json,
         id: Int = "registered" <~~ json
         else { return nil }
      
      self.firstname = firstName
      self.lastname = lastName
      self.id = id
   }
}

extension ComplexPerson: Decodable {
   init?(json: JSON) {
      guard let firstName: String = "name.first" <~~ json,
         lastName: String = "name.last" <~~ json,
         id: Int = "registerDetails.id" <~~ json
         else { return nil }
      self.firstname = firstName
      self.lastname = lastName
      self.id = id
   }
}
