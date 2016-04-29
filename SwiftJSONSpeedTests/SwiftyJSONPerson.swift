//
//  SwiftyJSONPerson.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import UIKit
import SwiftyJSON

extension Person {
   init(JSON: SwiftyJSON.JSON) {
      firstname = JSON["first"].stringValue
      lastname = JSON["last"].stringValue
      id = JSON["registered"].intValue
   }
}

extension PersonList {
   init(JSON: SwiftyJSON.JSON) {
      var persons = [ComplexPerson]()
      for (_, subJson):(String, SwiftyJSON.JSON) in JSON {
         let person = ComplexPerson(aFirstName: subJson["name"]["first"].stringValue, aLastName: subJson["name"]["second"].stringValue, anId: subJson["registerDetails"]["id"].intValue)
         persons.append(person)
      }
      
      self.persons = persons
   }
}

