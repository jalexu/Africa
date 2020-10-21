//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Jaime Uribe on 20/10/20.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: -PROPERTIES
    @State private var ramdomCircle = Int.random(in: 12...16)
    @State private var isAnimate: Bool = false
    
    //1. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) ->CGFloat{
        return CGFloat.random(in: 0...max)
    }
    
    //2. RANDOM SIZE
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 0...300))
    }
    
    //3. RANDOM SCALE
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //4. RANDOM SPEED
    func randomSpeed() -> Double{
        return Double.random(in: 0.025...1.0)
    }
    
    //5. RANDOM DELAY
    func randomDelay() -> Double{
        return Double.random(in: 0...2)
    }
    
    //MARK: -BODY
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                ForEach(0...ramdomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimate ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
//                            x: geometry.size.width / 2,
//                            y: geometry.size.height / 2
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform:{
                            isAnimate = true
                        })
                }
//                Text("Width \(Int(geometry.size.width)) Height: \(Int(geometry.size.height))")
            }//: ZSTACK
            .drawingGroup()
        }//: GEOMETRY
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
