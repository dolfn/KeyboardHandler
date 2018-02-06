//
//  KeyboardHandlerForBottomConstraintTests.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import XCTest
@testable import KeyboardHandler

class KeyboardHandlerForBottomConstraintTests: XCTestCase {

    var sut: KeyboardHandlerForBottomConstraint!
    var delegate: KeyboardHandlerDelegateSpy!
    
    override func setUp() {
        super.setUp()
        let constraintToAnimate = NSLayoutConstraint()
        let constraintOffset: CGFloat = 10
        let viewThatCanContainTextInputs = UIView()
        sut = KeyboardHandlerForBottomConstraint(constraintToAnimate: constraintToAnimate, constraintOffset: constraintOffset, viewThatCanContainTextInputs: viewThatCanContainTextInputs, viewToDismissKeyboardOnTap: nil)
        delegate = KeyboardHandlerDelegateSpy()
        sut.delegate = delegate
    }
    
    override func tearDown() {
        sut = nil
        delegate = nil
        super.tearDown()
    }
    
    func test_WillShowKeyboardEvent_DidCallDelegate() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .willShow)
        XCTAssertTrue(delegate.willShowKeyboardCalled)
        XCTAssertFalse(delegate.didShowKeyboardCalled)
        XCTAssertFalse(delegate.willHideKeyboardCalled)
        XCTAssertFalse(delegate.didHideKeyboardCalled)
        XCTAssertEqual(delegate.receivedHeight!, 100)
    }
    
    func test_DidShowKeyboardEvent_DidCallDelegate() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .didShow)
        XCTAssertFalse(delegate.willShowKeyboardCalled)
        XCTAssertTrue(delegate.didShowKeyboardCalled)
        XCTAssertFalse(delegate.willHideKeyboardCalled)
        XCTAssertFalse(delegate.didHideKeyboardCalled)
        XCTAssertEqual(delegate.receivedHeight!, 100)
    }
    
    func test_WillHideKeyboardEvent_DidCallDelegate() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .willHide)
        XCTAssertFalse(delegate.willShowKeyboardCalled)
        XCTAssertFalse(delegate.didShowKeyboardCalled)
        XCTAssertTrue(delegate.willHideKeyboardCalled)
        XCTAssertFalse(delegate.didHideKeyboardCalled)
        XCTAssertEqual(delegate.receivedHeight!, 100)
    }
    
}
