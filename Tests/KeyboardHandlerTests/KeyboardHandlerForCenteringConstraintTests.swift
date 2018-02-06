//
//  KeyboardHandlerForCenteringConstraintTests.swift
//  KeyboardHandler-iOS Tests
//
//  Created by Andrei Nastasiu on 06/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import XCTest
@testable import KeyboardHandler

class KeyboardHandlerForCenteringConstraintTests: XCTestCase {
    
    func test_ShowingKeyboard_DecreaseConstraintValueWithHalfOfTheKeyboardValue() {
        let constraint = NSLayoutConstraint()
        constraint.constant = 100
        let sut = KeyboardHandlerForCenteringConstraint(constraint: constraint)
        sut.handleKeyboard(withHeight: 600, keyboardStatus: .willShow)
        XCTAssertEqual(constraint.constant, -200)
    }
}
