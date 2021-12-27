//
//  ContentView.swift
//  Bullseye
//
//  Created by Mozart Sousa on 07/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertVisible = false;
    @State private var sliderPosition = 50.0;
    @State private var gameModel = GameModel()
    
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea(.all)
            VStack{
                bullseyeTextAndTarget;
                sliderHStack;
                hitMeButton;
            }//end VStack
            .padding()
        }//end ZStack backgroundColor
        
    }//end bodyView
    
    ///Bullseye texts
    var bullseyeTextAndTarget : some View{
        VStack{
            Text("🎯🎯🎯\nPut the BullSEye as close as you can to".uppercased())
                .foregroundColor(Color("TextColor"))
                .bold()
                .font(.footnote)
                .kerning(2.0)
                .lineSpacing(4.0)
                .multilineTextAlignment(.center)
            Text(String(gameModel.target))
                .foregroundColor(Color("TextColor"))
                .fontWeight(.black)
                .font(.largeTitle)
                .kerning(-1)
        }
    }//end bullseyeTextAndTarget
    
    /// HStack 1 to 100 slider
    var sliderHStack : some View{
        
        HStack {
            Text("1")
                .foregroundColor(Color("TextColor"))
                .bold()
                .font(.headline)
            Slider(value: $sliderPosition, in: 1.0...100.0)
            Text("100")
                .foregroundColor(Color("TextColor"))
                .bold()
                .font(.headline)
        }
    }//end sliderHStack
    
    ///Build a button that active an alert
    var hitMeButton : some View{
        Button(action: {
            isAlertVisible = true;
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            })
        .foregroundColor(Color.white)
        .cornerRadius(21)
        .alert(isPresented: $isAlertVisible, content: {
            let roundedValue = Int(sliderPosition.rounded())
            
            return Alert(title: Text("Hello there"),
                         message: Text("The slider's value is \(roundedValue).\n" +
                                       "You scored \(gameModel.points(sliderPoints: roundedValue )) points this round."),
                         dismissButton: .default(Text("Awesome!")))
        })
    }// end hitMeButton
    
    
}//end ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        //Dark Mode
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }//end previews
}//end ontentView_Previews

