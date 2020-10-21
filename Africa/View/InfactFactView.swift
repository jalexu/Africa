//
//  InfactFactView.swift
//  Africa
//
//  Created by Jaime Uribe on 18/10/20.
//

import SwiftUI

struct InfactFactView: View {
    
    //MARK: -PROPERTIES
    var animal: AnimalMode
    
    var body: some View {
        GroupBox {
             TabView {
                ForEach(animal.fact, id:\.self) { item in
                    Text(item)
                }
            }//: TABVIEW
             .tabViewStyle(PageTabViewStyle())
             .frame(minWidth: 170, idealWidth: 175, maxHeight: 180)
        }//: GROUPBOX
    }
}

struct InfactFactView_Previews: PreviewProvider {
    static var animal: [AnimalMode] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InfactFactView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
