//use only for maxapp
//COPIRIGNT 2021 MAX21160

//  Prelaunch.swift
//  LaunchScreen
//
//  Created by Maxime DJ on 30/07/2021.
//

import SwiftUI

struct Prelaunch: View {
    @State private var animationisok = false
    @State private var angle: Double = 360
    @State private var opacity : Double = 1
    @State private var scale : CGFloat = 1
    
    var body: some View {
        
        Group {
            if animationisok == true {
                //if the animation is finish we have to show the homeVIew
ContentView()
            } else {
                //else do the animation
                
                ZStack {
                    
                    Image("bg")//change background image here 
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 2000, height: 1500)
                    Image("Icon")//you can change your icone here
                        .resizable()
                        .frame(width: 200, height: 200)
                        .rotation3DEffect(
                            .degrees(angle),
                            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                        )
                        .opacity(opacity)
                        .scaleEffect(scale)
                }
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2)) {
                angle = 0
                scale = 3
                opacity = 0
            }
            withAnimation(.linear.delay(1.75)) {
                animationisok = true
                
            }
        }
    }
}


struct PrelaunchView_Previews: PreviewProvider {
    static var previews: some View {
        Prelaunch()
    }
}



