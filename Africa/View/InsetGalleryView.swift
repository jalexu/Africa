//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Jaime Uribe on 17/10/20.
//

import SwiftUI

struct InsetGalleryView: View {
    
    var animal: AnimalMode
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }//: HSTACK
        }//: SCROLL
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static var animals: [AnimalMode] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
