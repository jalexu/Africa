//
//  CoverImageView.swift
//  Africa
//
//  Created by Jaime Uribe on 17/10/20.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: -PROPERTIES
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: -BODY
    var body: some View {
        
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//: LOOP
        }//: TABVIEW
        //se visualiza de toda la pantalla
        .tabViewStyle(PageTabViewStyle())
    }
}

//MARK: -PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
