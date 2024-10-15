//
//  Utils.swift
//  MyCatalog
//
//  Created by Emil Atanasov on 10/15/24.
//

import Foundation

extension Int {
    var toBGN: String {
        "\(self) лв."
    }
}

struct Item {
    let name: String
    let price: Double
    let description: String
}

extension Item: Decodable {
    
}

extension Item {
    static func parse(data jsonData: Data) throws -> [Item] {
        let decoder = JSONDecoder()
        let items = try decoder.decode([Item].self, from: jsonData)
        return items
    }
}
