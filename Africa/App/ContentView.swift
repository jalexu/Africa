//
//  ContentView.swift
//  Africa
//
//  Created by Jaime Uribe on 17/10/20.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: -PROPERTIES
    let animal: [AnimalMode] = Bundle.main.decode("animals.json")
    
    //MARK: -BODY
    var body: some View {
        NavigationView {
            List{
                CoverImageView()
                    .frame(height:300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animal){ animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal))
                    {
                        AnimalListItemView(animal: animal)
                    }//: LINK
                    
                }
            }//: LIST
            .navigationBarTitle("Africa", displayMode: .large)
        }//: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
