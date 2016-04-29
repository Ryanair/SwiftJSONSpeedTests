//
//  UnboxSpeedTests.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import XCTest
import Unbox

class UnboxSpeedTests: XCTestCase {
   func testOneSimpleUnboxer() {
      let data = loadTestData("SimpleJSON")!
      
      self.measureBlock {
         let _: Person? = Unbox(data)
      }
   }
   
   func testManySimpleUnboxer() {
      let data = loadTestData("SimpleJSON")!
      
      self.measureBlock {
         for _ in 0...1000 {
            let _: Person? = Unbox(data)
         }
      }
   }
   
   // Unboxer can't unbox a double array!! https://github.com/JohnSundell/Unbox/issues/34
   func testComplexUnboxer() {
      let data = loadTestData("ComplexJSON")!
      // We have to add a key so we can parse the JSON: Arrays without keys are not supported
      let stringWithPeopleKey = "{\"people\":\n\(String(data: data, encoding: NSUTF8StringEncoding)!)}"
      let dataWithPeopleKey = stringWithPeopleKey.dataUsingEncoding(NSUTF8StringEncoding)!
      
      self.measureBlock {
         let _: PersonList? = Unbox(dataWithPeopleKey)
      }
   }
}