//
//  DetailsView.swift
//  MyCatalog
//
//  Created by Emil Atanasov on 10/15/24.
//

import SwiftUI

struct DetailsView: View {
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
            Spacer()
            Text(toy.description)
        }
        .padding()
    }
}

#Preview {
    DetailsView(toy: Item.mock)
}
