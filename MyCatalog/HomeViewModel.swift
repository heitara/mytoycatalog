//
//  HomeViewModel.swift
//  MyCatalog
//
//  Created by Emil Atanasov on 10/15/24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var items = [Item]()
    
    func load() async {
        guard let fileURL = Bundle.main.url(forResource: "toys.data", withExtension: "json") else {
            return
        }
        guard let jsonData = try? Data(contentsOf: fileURL) else {
            return
        }
        // Read the data from the file
        let items = try? Item.parse(data: jsonData)
        if let items {
            self.items = items
        }
    }
}
