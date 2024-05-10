//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Abdelaziz Bennacer on 09/05/2024.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(
                        animal.name,
                        destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!
                    )
                }
                .foregroundStyle(.accent)
            }
        }
    }
}

#Preview {
    @State var animals: [Animal] = Bundle.main.decode("animals.json")
    return ExternalWeblinkView(animal: animals[0])
}
