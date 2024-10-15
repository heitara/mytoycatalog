//
//  Model.swift
//  MyCatalog
//
//  Created by Emil Atanasov on 10/15/24.
//

import Foundation

struct Item {
    let id: Int
    let name: String
    let price: Double
    let description: String
}

extension Item: Identifiable {
    
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

enum FileError: Error {
    case missingFile
}
