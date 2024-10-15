//
//  HomeView.swift
//  MyCatalog
//
//  Created by Emil Atanasov on 10/15/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.items) { item in
                    NavigationLink(value: item) {
                        ToyView(toy: item)
                    }
                }
            }
            .navigationDestination(for: Item.self) { toy in
                    DetailsView(toy: toy)
                    .navigationTitle(toy.name.firstWord ?? "")
            }
            
        }
        .task {
            await viewModel.load()
        }
    }
}

struct ToyView: View {
    var toy: Item
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(toy.name)
                .font(.title)
            Group {
                Text("Price: ") + Text(toy.price.toBGN)
            }
            .font(.subheadline)
            .foregroundStyle(Color.gray)
                
            Text(toy.description)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}

#Preview("Toy View") {
    ToyView(toy: Item.mock)
}
