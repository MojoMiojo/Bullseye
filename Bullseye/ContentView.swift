//
//  ContentView.swift
//  Bullseye
//
//  Created by Mozart Sousa on 07/12/21.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isAlertVisible : Bool = false;
	
	var body: some View {
		VStack {
			VStack{
				Text("🎯🎯🎯\nPut the BullSEye as close as you can to")
					.bold()
					.font(.footnote)
					.kerning(2.0)
					.lineSpacing(4.0)
					.multilineTextAlignment(.center)
					.textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
				Text("89")
					.fontWeight(.black)
					.font(.largeTitle)
					.kerning(-1)
				HStack {
					Text("1")
						.bold()
						.font(.headline)
					Slider(value: .constant(50), in: 1.0...100.0)
					Text("100")
						.bold()
						.font(.headline)
				}
				Button(action: {
					self.isAlertVisible = true;
				}) {
					Text("Hit me")
				}
				.alert(isPresented: $isAlertVisible, content: {
					Alert(title: Text("Hello there"),
								message: Text("This is my first pop-up"),
								dismissButton: .default(Text("Awesome!"))
					)
				})
			}
			
		}//end VStack
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
		ContentView()
			.previewLayout(.fixed(width: 568, height: 320))
	}
}

