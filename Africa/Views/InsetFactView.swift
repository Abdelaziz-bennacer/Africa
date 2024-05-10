//
//  InsetFactView.swift
//  Africa
//
//  Created by Abdelaziz Bennacer on 09/05/2024.
//

import SwiftUI

struct InsetFactView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: TABS
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: BOX
    }
}

#Preview {
    @State var animals: [Animal] = Bundle.main.decode("animals.json")
    return InsetFactView(animal: animals[6])
}
