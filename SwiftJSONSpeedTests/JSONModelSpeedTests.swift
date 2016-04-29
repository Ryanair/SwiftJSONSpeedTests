//
//  SwiftJSONSpeedTests.swift
//  SwiftJSONSpeedTests
//
//  Created by Miquel, Aram on 26/04/2016.
//  Copyright © 2016 Ryanair. All rights reserved.
//

import XCTest
import JSONModel

@testable import SwiftJSONSpeed

class JSONModelSpeedTests: XCTestCase {
   
   func testOneSimpleJSONModel() {
      let data = loadTestData("SimpleJSON")!
      
      self.measureBlock { 
         let string = String(data: data, encoding: NSUTF8StringEncoding)
         let error: AutoreleasingUnsafeMutablePointer<JSONModelError?> = nil
         let jsonModelPerson = JSONModelPerson(string: string, error: error)
         print(jsonModelPerson)
      }
   }
   
   func testManySimpleJSONModel() {
      let data = loadTestData("SimpleJSON")!
      
      self.measureBlock {
         for _ in 0...1000 {
            let string = String(data: data, encoding: NSUTF8StringEncoding)
            let error: AutoreleasingUnsafeMutablePointer<JSONModelError?> = nil
            let _ = JSONModelPerson(string: string, error: error)
         }
      }
   }
   
   func testComplexJSONModel() {
      let data = loadTestData("ComplexJSON")!
      
      self.measureBlock { 
         let string = "{\"people\":\n\(String(data: data, encoding: NSUTF8StringEncoding)!)}"
         let error: AutoreleasingUnsafeMutablePointer<JSONModelError?> = nil
         let _ = JSONModelComplexList(string: string, error: error)
      }
   }
}

extension XCTestCase {
   func loadTestData(testDataFilename: String) -> NSData? {
      guard let testDataPath = NSBundle(forClass: JSONModelSpeedTests.self).pathForResource(testDataFilename, ofType: "json"),
         let testData = NSData(contentsOfFile: testDataPath)
         else {
            return nil
      }
      
      return testData
   }
}
