//
//  GameModel.swift
//  Bullseye
//
//  Created by Mozart Sousa on 13/12/21.
//

import Foundation

struct GameModel {
	var target: Int = Int.random(in: 1...100)
	var score: Int = 0
	var round: Int = 1
	
	func points(sliderPoints: Int) -> Int{
		let difference : Int = abs(self.target - sliderPoints);
		
		//		if difference < 0 {
		//			difference *= -1;
		//		}
		
		//		if ( self.target > sliderPoints ) {
		//			difference =  self.target - sliderPoints;
		//		} else if ( self.target < sliderPoints ) {
		//			difference = sliderPoints - self.target;
		//		} else {
		//			difference = 0;
		//		}
		
		return  100 - difference;
		
	}//end points
	
}//end GameModel

