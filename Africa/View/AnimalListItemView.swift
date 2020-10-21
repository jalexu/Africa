//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Jaime Uribe on 17/10/20.
//

import SwiftUI

struct AnimalListItemView: View {
    
    //MARK: -PROPERTIES
    let animal: AnimalMode
    
    //MARK: -BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16, content: {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            VStack (alignment: .leading, spacing: 8, content: {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.leading, 1)
            })//: VSTACK
        }) //:HSTACK
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static var animal: [AnimalMode] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalListItemView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
