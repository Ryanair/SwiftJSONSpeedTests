//
//  DecodablePerson.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import UIKit
import Decodable

extension Person: Decodable {
   static func decode(_ json: Any) throws -> Person {
      return try Person(
         aFirstName: json => "first",
         aLastName: json => "last",
         anId: json => "registered"
      )
   }
}

extension ComplexPerson: Decodable {
   static func decode(_ json: Any) throws -> ComplexPerson {
      return try ComplexPerson(
         aFirstName: json => "name" => "first",
         aLastName: json => "name" => "last",
         anId: json => "registerDetails" => "id"
      )
   }
}
