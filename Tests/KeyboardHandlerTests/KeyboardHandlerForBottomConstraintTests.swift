//
//  KeyboardHandlerForBottomConstraintTests.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import XCTest
@testable import KeyboardHandler

class KeyboardHandlerForBottomConstraintTests: XCTestCase {

    func test_WillShowKeyboardEvent_DidCallDelegate() {
        let constraintToAnimate = NSLayoutConstraint()
        let constraintOffset: CGFloat = 10
        let viewThatCanContainTextInputs = UIView()
        let sut = KeyboardHandlerForBottomConstraint(constraintToAnimate: constraintToAnimate, constraintOffset: constraintOffset, viewThatCanContainTextInputs: viewThatCanContainTextInputs, viewToDismissKeyboardOnTap: nil)
        let delegate = KeyboardHandlerDelegateSpy()
        sut.delegate = delegate
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .willShow)
        XCTAssertTrue(delegate.willShowKeyboardCalled)
        XCTAssertEqual(delegate.receivedHeight!, 100)
    }
}
