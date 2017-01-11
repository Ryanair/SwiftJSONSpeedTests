//
//  GlossSpeedTests.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import XCTest
import Gloss

class GlossSpeedTests: XCTestCase {
   func testOneSimpleGloss() {
      let data = loadTestData("SimpleJSON")!
      
      self.measure {
         do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            let _ = Person.init(json: json as! Gloss.JSON)
         } catch {
            print(error)
         }
      }
   }
   
   func testManySimpleGloss() {
      let data = loadTestData("SimpleJSON")!
      
      self.measure {
         do {
            for _ in 0...1000 {
               let json = try JSONSerialization.jsonObject(with: data, options: [])
               let _ = Person.init(json: json as! Gloss.JSON)
            }
         } catch {
            print(error)
         }
      }
   }
   
   func testComplexGloss() {
      let data = loadTestData("ComplexJSON")!
      
      self.measure {
         do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            let _ = [ComplexPerson].from(jsonArray: json as! [Gloss.JSON])
         } catch {
            print(error)
         }
      }
   }
}
