//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Studio Sol on 04/01/22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game : GameModel
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}// end BackgroundView

struct RingsView: View{
    
    var body: some View{
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            ForEach(1..<6){ ring in
                let size = CGFloat(ring * 100)
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(
                        RadialGradient(
                            colors: [Color("BackgroundRingColor").opacity(0.3 * 0.8),
                                     Color("BackgroundRingColor").opacity(0)],
                            center: .center,
                            startRadius: 100,
                            endRadius: 300)
                    )
                    .frame(width: size, height: size)
            }//end forEach
        }// end ZStack
    }// end body
    
}//end RingsView

struct TopView: View {
    @Binding var game : GameModel
    
    var body: some View {
        HStack {
            //RestartButton
            Button(action: {
                game.restartGame()
            }) {
                RoundViewsStroked(systemName: "arrow.counterclockwise")
            }// end button closure
            Spacer()
            RoundViewsStroked(systemName: "list.dash")
        }
    }
}// end TopView

struct BottomView: View {
    @Binding var game : GameModel
    
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}// end BottomView

struct NumberView: View{
    var title: String
    var text: String
    
    var body: some View{
        VStack(spacing:5) {
            Text(title.uppercased())
                .foregroundColor(Color("TextColor"))
                .font(.caption)
                .bold()
            Text(text.uppercased())
                .foregroundColor(Color("TextColor"))
                .font(.title2)
                .bold()
                .frame(width: 68.0, height: 56.0)
                .cornerRadius(21)
                .overlay(
                    RoundedRectangle(cornerRadius: 21)
                        .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2))
        }//end VStack
    }//end View
    
}// end NumberView

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(GameModel()))
            .previewLayout(.fixed(width: 568, height: 320))
        BackgroundView(game: .constant(GameModel()))
        BackgroundView(game: .constant(GameModel()))
            .preferredColorScheme(.dark)
    }
}
