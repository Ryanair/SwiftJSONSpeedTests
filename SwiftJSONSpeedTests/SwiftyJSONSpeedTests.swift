//
//  SwiftyJSONSpeedTests.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import XCTest
import SwiftyJSON

class SwiftyJSONSpeedTests: XCTestCase {
   
   func testOneSimpleSwiftyJSON() {
      let data = loadTestData("SimpleJSON")!
      
      self.measureBlock {
         let _ = Person(JSON: JSON(data: data))
      }
   }
   
   func testManySimpleSwiftyJSON() {
      let data = loadTestData("SimpleJSON")!
      
      self.measureBlock {
         for _ in 0...1000 {
            let _ = Person(JSON: JSON(data: data))
         }
      }
   }
   
   func testComplexSwiftyJSON() {
      let data = loadTestData("ComplexJSON")!
      
      self.measureBlock {
         let _ = PersonList(JSON: JSON(data: data))
      }
      
   }
}
