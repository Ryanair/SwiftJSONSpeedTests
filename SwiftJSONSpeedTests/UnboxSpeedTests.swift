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
      func test(data: Data) {
         do {
            let _: Person = try unbox(data: data)
         } catch {
            
         }
      }
      
      let data = loadTestData("SimpleJSON")!

      self.measure {
         test(data: data)
      }
   }
   
   func testManySimpleUnboxer() {
      func test(data: Data) {
         do {
            let _: Person = try unbox(data: data)
         } catch {
            
         }
      }
      
      let data = loadTestData("SimpleJSON")!
      
      self.measure {
         for _ in 0...1000 {
            test(data: data)
         }
      }
   }
   
   // Unboxer can't unbox a double array!! https://github.com/JohnSundell/Unbox/issues/34
   func testComplexUnboxer() {
      func test(data: Data) {
         do {
            let _: PersonList = try unbox(data: data)
         } catch {
            
         }
      }
      
      let data = loadTestData("ComplexJSON")!
      // We have to add a key so we can parse the JSON: Arrays without keys are not supported
      let stringWithPeopleKey = "{\"people\":\n\(String(data: data, encoding: String.Encoding.utf8)!)}"
      let dataWithPeopleKey = stringWithPeopleKey.data(using: String.Encoding.utf8)!
      
      self.measure {
         test(data: dataWithPeopleKey)
      }
   }
}
