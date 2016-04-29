//
//  Person.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 27/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import UIKit

struct Person {
   let firstname: String
   let lastname: String
   let id: Int
      
   init(aFirstName: String, aLastName: String, anId: Int) {
      self.firstname = aFirstName
      self.lastname = aLastName
      self.id = anId
   }
}

struct PersonList {
   
   let persons: [ComplexPerson]
   
   init(persons: [ComplexPerson]) {
      self.persons = persons
   }
}

struct ComplexPerson {
   let firstname: String
   let lastname: String
   let id: Int
   
   init(aFirstName: String, aLastName: String, anId: Int) {
      self.firstname = aFirstName
      self.lastname = aLastName
      self.id = anId
   }
}
