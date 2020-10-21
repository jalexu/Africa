//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Jaime Uribe on 17/10/20.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: -PROPERTIES
    let animal: AnimalMode
    
    
    //MARK: -BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment:.center, spacing: 20) {
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                //TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 8)
                            .offset(y: 24)
                    )
                //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                //GALLERY
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //FACT
                Group{
                    HeadingView(headingImage: "questionMark.circle", headingText: "Did you now?")
                    InfactFactView(animal: animal)
                }
                .padding(.horizontal)
                
                //DECRIPTION
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //MAP
                Group{
                    HeadingView(headingImage: "map", headingText: "National parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //LINK
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                
            }//: VSTACK
        }//: SCROLL
        .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static var animal: [AnimalMode] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animal[0])
                .previewDevice("iPhone 11 Pro")
        }
    }
}
