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

struct MyCatalogTests {

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
