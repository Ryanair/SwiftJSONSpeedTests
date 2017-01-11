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
      
      self.measure { 
         let string = String(data: data, encoding: String.Encoding.utf8)
         let error: AutoreleasingUnsafeMutablePointer<JSONModelError?>? = nil
         let jsonModelPerson = JSONModelPerson(string: string, error: error)
         print(jsonModelPerson as Any)
      }
   }
   
   func testManySimpleJSONModel() {
      let data = loadTestData("SimpleJSON")!
      
      self.measure {
         for _ in 0...1000 {
            let string = String(data: data, encoding: String.Encoding.utf8)
            let error: AutoreleasingUnsafeMutablePointer<JSONModelError?>? = nil
            let _ = JSONModelPerson(string: string, error: error)
         }
      }
   }
   
   func testComplexJSONModel() {
      let data = loadTestData("ComplexJSON")!
      
      self.measure { 
         let string = "{\"people\":\n\(String(data: data, encoding: String.Encoding.utf8)!)}"
         let error: AutoreleasingUnsafeMutablePointer<JSONModelError?>? = nil
         let _ = JSONModelComplexList(string: string, error: error)
      }
   }
}

extension XCTestCase {
   func loadTestData(_ testDataFilename: String) -> Data? {
      guard let testDataPath = Bundle(for: JSONModelSpeedTests.self).path(forResource: testDataFilename, ofType: "json"),
         let testData = try? Data(contentsOf: URL(fileURLWithPath: testDataPath))
         else {
            return nil
      }
      
      return testData
   }
}
