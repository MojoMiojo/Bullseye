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
        let pointsMade = abs(target - sliderPoints)
        var score = 100 - pointsMade;
        
        //Bonus score
        if sliderPoints == target {
            score += 100
        } else if pointsMade <= 2  {
            score += 50
        }
        
        return score
    }//end points
    
    mutating func startNewRound(points: Int){
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }//end startNewRound
    
    mutating func restartGame(){
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }//end restartGame
    
}//end GameModel

