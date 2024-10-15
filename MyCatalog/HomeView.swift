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
        VStack {
//            ForEach(viewModel.items) { item in
//                ToyView(toy: item)
//            }
        }
        .padding()
    }
}

struct ToyView {
    var toy: Item
    
    var body: some View {
        VStack {
            Text(toy.name)
            Text("Price: ") + Text(toy.price.toBGN)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
