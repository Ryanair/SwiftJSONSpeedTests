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
      
      self.measureBlock {
         let jsonString = String(data: data, encoding: NSUTF8StringEncoding)
         let _ = Mapper<Person>().map(jsonString)
      }
   }
   
   func testManySimpleObjectMapper() {
      let data = loadTestData("SimpleJSON")!
      
      self.measureBlock {
         for _ in 0...1000 {
            let jsonString = String(data: data, encoding: NSUTF8StringEncoding)
            let _ = Mapper<Person>().map(jsonString)
         }
      }
   }
   
   func testComplexObjectMapper() {
      let data = loadTestData("ComplexJSON")!
      
      self.measureBlock { 
         let jsonString = "{\"people\":\n\(String(data: data, encoding: NSUTF8StringEncoding)!)}"
         let _ = Mapper<PersonList>().map(jsonString)
      }
   }
}
