//
//  ObjectMapperSpeedTests.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import XCTest
import ObjectMapper

class ObjectMapperSpeedTests: XCTestCase {
   
   func testOneSimpleObjectMapper() {
      let data = loadTestData("SimpleJSON")!
      
      self.measure {
         let jsonString = String(data: data, encoding: String.Encoding.utf8)
         let _ = Mapper<Person>().map(JSONString: jsonString!)
      }
   }
   
   func testManySimpleObjectMapper() {
      let data = loadTestData("SimpleJSON")!
      
      self.measure {
         for _ in 0...1000 {
            let jsonString = String(data: data, encoding: String.Encoding.utf8)
            let _ = Mapper<Person>().map(JSONString: jsonString!)
         }
      }
   }
   
   func testComplexObjectMapper() {
      let data = loadTestData("ComplexJSON")!
      
      self.measure { 
         let jsonString = "{\"people\":\n\(String(data: data, encoding: String.Encoding.utf8)!)}"
         let _ = Mapper<PersonList>().map(JSONString: jsonString)
      }
   }
}
