//
//  JSONJoySpeedTests.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import XCTest
import JSONJoy

class JSONJoySpeedTests: XCTestCase {
   
   func testOneSimpleJSONJoy() {
      let data = loadTestData("SimpleJSON")!
      
      self.measure { 
         do {
            let _ = try Person(JSONDecoder(data))
         } catch {
            print(error)
         }
      }
   }
   
   func testManySimpleJSONJoy() {
      let data = loadTestData("SimpleJSON")!
      
      self.measure { 
         do {
            for _ in 0...1000 {
               let _ = try Person(JSONDecoder(data))
            }
         } catch {
            print(error)
         }
      }
   }
   
   func testComplexJSONJoy() {
      let data = loadTestData("ComplexJSON")!
      // We have to add a key so we can parse the JSON: Arrays without keys are not supported
      let stringWithPeopleKey = "{\"people\":\n\(String(data: data, encoding: String.Encoding.utf8)!)}"
      let dataWithPeopleKey = stringWithPeopleKey.data(using: String.Encoding.utf8)!
      self.measure { 
         do {
            let _ = try PersonList(JSONDecoder(dataWithPeopleKey))
         } catch {
            print(error)
         }
      }
   }
}
