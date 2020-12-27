//
//  MessageBubbleViewTests.swift
//  MessageBubbleViewTests
//
//  Created by Josh Arnold on 12/26/20.
//

import XCTest
@testable import MessageBubbleView


class MessageBubbleViewTests: XCTestCase {

    var bubbleView:MessageBubbleView!
    
    override func setUp() {
        bubbleView = MessageBubbleView()
    }
    
    func testAdd() {
        XCTAssertEqual(bubbleView.add(a: 1, b: 1), 2)
    }
    
    func testSub() {
        XCTAssertEqual(bubbleView.sub(a: 1, b: 1), 0)
        XCTAssertEqual(bubbleView.sub(a: 20, b: 6), 14)
    }
}
