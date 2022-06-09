
//© 2021 Max21910

//  Prelaunch.swift
//  LaunchScreen
//
//  Created by Maxime DJ on 30/07/2021.
//
import SwiftUI

struct Prelaunch: View {
    
    @State private var animationisok = false //animation is not launch
    @State private var angle: Double = 360
    @State private var opacity : Double = 1
    @State private var scale : CGFloat = 1
    
    var body: some View {
        //view of the launchscreen
        
        Group {
            if animationisok == true {
                //if the animation is finish we have to show another view wich in this case is the ContentView
                ContentView()//This is the view which will be show after the animation
                
                
            } else {
                //if the animation is not finish or no start this will show the animation
                
                ZStack {
                    
                    Image("bg") //change the  background of the image in the (Assets Folder)
                    
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) //force the animation to take up the entire screen
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 2000, height: 1500)
                    Image("Icon")//you can change your icone in the asset folder
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
        //Animation
        .onAppear { // OnAppear perform the code of the animation this is use to make sure the animation will not start if the view is not ready to show it  :
            withAnimation(Animation.linear(duration: 2)) {
                angle = 0
                scale = 3
                opacity = 0
            }
            withAnimation(.linear.delay(1.75)) {
                animationisok = true //tell the script that the animation is finished and display the aappropriate  screen
                
            }
        }
    }
}


struct PrelaunchView_Previews: PreviewProvider {
    static var previews: some View {
        Prelaunch()
    }
}



