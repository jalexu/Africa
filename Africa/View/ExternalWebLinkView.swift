//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Jaime Uribe on 18/10/20.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //MARK: -PROPERTIES
    var animal: AnimalMode
    
    //MARK: -BODY
    var body: some View {
        GroupBox{
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }//: HSTACK
        }//: BOX
        
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static var animals: [AnimalMode] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
