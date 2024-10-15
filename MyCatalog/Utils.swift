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

extension Double {
    var toBGN: String {
        String(format: "%.2f лв.", self)
    }
}

