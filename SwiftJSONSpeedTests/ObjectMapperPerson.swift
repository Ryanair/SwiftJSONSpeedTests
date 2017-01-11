//
//  ObjectMapperPerson.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import ObjectMapper

extension Person: Mappable {
   init?(map: Map) {
      
      // To use '<-' it has to be a var. If it's a let, you have to make this ugly thing in the init:
      var firstName: String = ""
      var lastName: String = ""
      var id: Int = 0
      
      firstName <- map["first"]
      lastName <- map["last"]
      id <- map["registered"]
      
      self.firstname = firstName
      self.lastname = lastName
      self.id = id
   }
   
   // As the struct has 'let' instead of 'var', we can't make use of this function :S
   mutating func mapping(map: Map) { }
}

extension PersonList: Mappable {
   init?(map: Map) {
      var persons: [ComplexPerson] = []
      
      persons <- map["people"]
      
      self.persons = persons
   }
   
   mutating func mapping(map: Map) { }
}

extension ComplexPerson: Mappable {
   init?(map: Map) {
      var firstName: String = ""
      var lastName: String = ""
      var id: Int = 0
      
      firstName <- map["name.first"]
      lastName <- map["name.last"]
      id <- map["registerDetails.id"]
      
      self.firstname = firstName
      self.lastname = lastName
      self.id = id
   }
   
   mutating func mapping(map: Map) { }
}
