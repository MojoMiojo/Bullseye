//
//  GameModel.swift
//  Bullseye
//
//  Created by Mozart Sousa on 13/12/21.
//

import Foundation

struct GameModel {
	var target = Int.random(in: 1...100)
	var score: Int = 0
	var round: Int = 1
	
	func points(sliderPoints: Int) -> Int{
		100 - abs(target - sliderPoints);
	}//end points
	
}//end GameModel

