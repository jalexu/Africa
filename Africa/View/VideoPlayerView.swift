//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Jaime Uribe on 18/10/20.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: -PROPERTIES
    var videoSelect: String
    var videoTitle: String
    
    //MARK: -BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelect, fileFormat: "mp4")){
                //Text("Lion")
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, 6)
                    .padding(.horizontal, 8)
                    .frame(width:60, height: 60), alignment: .topLeading
            )
        }//: VSTACK
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelect: "lion", videoTitle: "Lion")
        }
    }
}
