//
//  MyTests.swift
//  MyCatalog
//
//  Created by Emil Atanasov on 10/15/24.
//


import XCTest
@testable import MyCatalog

class MyXCTests: XCTestCase {

    func testReadJsonFile() {
        // Load the file from the test bundle
        guard let fileURL = Bundle(for: type(of: self)).url(forResource: "test.data", withExtension: "json") else {
            XCTFail("File not found.")
            return
        }

        do {
            // Read the data from the file
            let jsonData = try Data(contentsOf: fileURL)
            
            // Here, you can parse the JSON data
            let items = try Item.parse(data: jsonData)
            
            // Add assertions based on your requirements
            XCTAssertNotNil(items)
            XCTAssertGreaterThan(items.count, 0) // Example assertion

        } catch {
            XCTFail("Failed to read file: \(error)")
        }
    }
}
