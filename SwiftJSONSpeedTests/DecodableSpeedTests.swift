//
//  DecodableSpeedTests.swift
//  SwiftJSONSpeed
//
//  Created by Miquel, Aram on 28/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import XCTest
import Decodable

class DecodableSpeedTests: XCTestCase {
   func testOneSimpleDecodable() {
      let data = loadTestData("SimpleJSON")!
      
      self.measureBlock {
         do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
            let _ = try Person.decode(json)
         } catch {
            print(error)
         }
      }
   }
   
   func testManySimpleDecodable() {
      let data = loadTestData("SimpleJSON")!
      
      self.measureBlock {
         do {
            for _ in 0...1000 {
               let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
               let _ = try Person.decode(json)
            }
         } catch {
            print(error)
         }
      }
   }
   
   func testComplexDecodable() {
      let data = loadTestData("ComplexJSON")!
      
      self.measureBlock {
         do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
            let persons = try [ComplexPerson].decode(json)
            let _ = PersonList(persons: persons)
         } catch { }
      }
   }
}
