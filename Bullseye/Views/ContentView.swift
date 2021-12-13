//
//  ContentView.swift
//  Bullseye
//
//  Created by Mozart Sousa on 07/12/21.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isAlertVisible : Bool = false;
	@State private var sliderPosition : Double = 50.0;
	@State private var gameModel : GameModel = GameModel()
	
	var body: some View {
		
		VStack{
			Text("🎯🎯🎯\nPut the BullSEye as close as you can to")
				.bold()
				.font(.footnote)
				.kerning(2.0)
				.lineSpacing(4.0)
				.multilineTextAlignment(.center)
				.textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
			Text(String(gameModel.target))
				.fontWeight(.black)
				.font(.largeTitle)
				.kerning(-1)
			
			// 1 to 100 slider
			HStack {
				Text("1")
					.bold()
					.font(.headline)
				Slider(value: self.$sliderPosition, in: 1.0...100.0)
				Text("100")
					.bold()
					.font(.headline)
			}
			
			//Hit me button
			Button(action: {
				self.isAlertVisible = true;
			}) {
				Text("Hit me")
			}
			.alert(isPresented: $isAlertVisible, content: {
				let roundedValue: Int = Int(self.sliderPosition.rounded())
				
				return Alert(title: Text("Hello there"),
										 message: Text("The slider's value is \(roundedValue).\n" +
																	 "You scored \(self.gameModel.points(sliderPoints: roundedValue )) points this round."),
										 dismissButton: .default(Text("Awesome!"))
				)
			})//end button
		}//end VStack
	}//end body
	
}//end ContentView

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
		ContentView()
			.previewLayout(.fixed(width: 568, height: 320))
	}
}

