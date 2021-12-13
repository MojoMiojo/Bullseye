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
		let guess : Int = gameModel.target + 5;
		let score: Int = gameModel.points(sliderPoints: guess);
		XCTAssertEqual(score, 95)
	}
	
	func testNegativeScore() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		let guess : Int = gameModel.target - 5;
		let score: Int = gameModel.points(sliderPoints: guess);
		XCTAssertEqual(score, 95)
	}
	
	func testPerformanceExample() throws {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}
	
}
