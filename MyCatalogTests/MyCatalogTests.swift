//
//  MyCatalogTests.swift
//  MyCatalogTests
//
//  Created by Emil Atanasov on 10/15/24.
//

import Foundation
import Testing
@testable import MyCatalog


@Test("Integer price conversion to BGN")
func convertIntToBGN() async throws {
    let aHundred = 100
    #expect(aHundred.toBGN == "100 лв.", "Unable to convert to BGN.")
}

@Test("Double price conversion to BGN")
func convertDoubleToBGN() async throws {
    let aHundredPointTen = 100.10
    #expect(aHundredPointTen.toBGN == "100.10 лв.", "Unable to convert to BGN.")
}

// register a custom tag
extension Tag {
    @Tag static var json: Self
    @Tag static var model: Self
}

struct MyCatalogTests {
    @Suite(.tags(.json)) struct JsonTests {
        @Test func itemsListFromJSON() throws {
            guard let fileURL = Bundle(for: MyXCTests.self).url(forResource: "test.data", withExtension: "json") else {
                throw FileError.missingFile
            }
            // Read the data from the file
            let jsonData = try Data(contentsOf: fileURL)
            // Here, you can parse the JSON data
            let items = try Item.parse(data: jsonData)
            #expect(items.count > 0, "There are no items.")
            
        }
        
        @Test func itemsListConversionError() throws {
            #expect(throws: (any Error).self, "Unable to parse", performing: {
                guard let fileURL = Bundle(for: MyXCTests.self).url(forResource: "test.data.invalid", withExtension: "json") else {
                    throw FileError.missingFile
                }
                // Read the data from the file
                let jsonData = try Data(contentsOf: fileURL)
                // Here, you can parse the JSON data
                let items = try Item.parse(data: jsonData)
                #expect(items.count > 0, "There are no items.")
            })
        }
    }
    
    @Test("Age is non negative", .tags(.model), arguments: Age.allCases)
    func ageMapping(item: Age) async throws {
        #expect(item.age > 0)
    }

}

@Test
func firstWord() {
    let testCases: [(input: String, expected: String?)] = [
        ("Hello world", "Hello"),
        ("  Leading spaces", "Leading"),
        ("Trailing spaces  ", "Trailing"),
        ("SingleWord", "SingleWord"),
        ("", nil), // Empty string should return nil
        ("   ", nil) // String with only spaces should return nil
    ]
    
    for (input, expected) in testCases {
        let result = input.firstWord
        #expect(result == expected, "Expected '\(expected ?? "nil")' for input '\(input)', but got '\(result ?? "nil")'")
    }
}

@Test(arguments: [
    ("Hello world", "Hello"),
    ("  Leading spaces", "Leading"),
    ("Trailing spaces  ", "Trailing"),
    ("SingleWord", "SingleWord"),
    ("", nil), // Empty string should return nil
    ("   ", nil) // String with only spaces should return nil
])
func firstWordWithArguments(inputData: (String, String?)) {
    let (input, expected) = inputData
    let result = input.firstWord
    #expect(result == expected, "Expected '\(expected ?? "nil")' for input '\(input)', but got '\(result ?? "nil")'")
}

// Use it for better naming
//extension Age: @retroactive CustomTestStringConvertible {
//    public var testDescription: String {
//        "Age is less than \(self.age)"
//    }
//}
