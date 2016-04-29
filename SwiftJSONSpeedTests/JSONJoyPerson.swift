//
//  JSONJoyPerson.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import JSONJoy

extension Person: JSONJoy {
   init(_ decoder: JSONDecoder) throws {
      self.firstname = try decoder["first"].getString()
      self.lastname = try decoder["last"].getString()
      self.id = try decoder["registered"].getInt()
   }
}

extension PersonList: JSONJoy {
   init(_ decoder: JSONDecoder) throws {
      
      guard let persons = decoder["people"].array else {throw JSONError.WrongType}
      var collect = [ComplexPerson]()
      
      for personDecoder in persons {
         collect.append(try ComplexPerson(personDecoder))
      }
      
      self.persons = collect
   }
}

extension ComplexPerson: JSONJoy {
   init(_ decoder: JSONDecoder) throws {
      self.firstname = try decoder["name"]["first"].getString()
      self.lastname = try decoder["name"]["last"].getString()
      self.id = try decoder["registerDetails"]["id"].getInt()
   }
}