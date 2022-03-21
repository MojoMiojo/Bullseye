//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Mozart Sousa on 07/12/21.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
	
	var gameModel : GameModel!
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		gameModel = GameModel()
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		gameModel = nil
	}
	
	func testPositiveScore() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		let guess = gameModel.target + 5;
		let score = gameModel.points(sliderPoints: guess);
		XCTAssertEqual(score, 95)
	}
	
	func testNegativeScore() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		let guess = gameModel.target - 5;
		let score = gameModel.points(sliderPoints: guess);
		XCTAssertEqual(score, 95)
	}
	
	func testPerformanceExample() throws {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}
	
    func testNewRound() throws {
        gameModel.startNewRound(points: 100)
        XCTAssertEqual(gameModel.score, 100)
        XCTAssertEqual(gameModel.round, 2)
    }
    
    func testScoreExact() throws {
        let guess = gameModel.target
        let score = gameModel.points(sliderPoints: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose() throws {
        let guess = gameModel.target + 2
        let score = gameModel.points(sliderPoints: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    
    func testRestart() throws{
        gameModel.startNewRound(points: 50)
        gameModel.restartGame()
        XCTAssertEqual(gameModel.score, 0)
        XCTAssertEqual(gameModel.round, 1)
    }
}
