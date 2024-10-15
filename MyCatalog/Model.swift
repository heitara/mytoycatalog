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

extension Item: Hashable {
    
}

extension Item {
    static func parse(data jsonData: Data) throws -> [Item] {
        let decoder = JSONDecoder()
        let items = try decoder.decode([Item].self, from: jsonData)
        return items
    }
}

extension Item {
    static var mock: Item {
        Item(id: 1, name: "Spider-man", price: 100, description: "Dummy description of a Spider-man toy to test with in preview.")
    }
}

enum FileError: Error {
    case missingFile
}

enum Age {
    case lessThan4
    case lessThan10
}

extension Age {
    var age: Int {
        switch self {
        case .lessThan4:
            4
        case .lessThan10:
            10
        }
    }
}

extension Age: CaseIterable {
    
}
