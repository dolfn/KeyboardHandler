//
//  KeyboardHandlerForBottomConstraintTests.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import XCTest
@testable import KeyboardHandler

class KeyboardHandlerForBottomConstraintTests: XCTestCase {

    weak var weakSut: KeyboardHandlerForBottomConstraint?
    var sut: KeyboardHandlerForBottomConstraint!
    var delegate: KeyboardHandlerDelegateSpy!
    private var viewThatCanContainTextInputs: UIView?
    private var viewToDismissKeyboardOnTap: UIView?
    
    override func setUp() {
        super.setUp()
        let constraintToAnimate = NSLayoutConstraint()
        let constraintOffset: CGFloat = 10
        viewThatCanContainTextInputs = UIView()
        viewToDismissKeyboardOnTap = UIView()
        sut = KeyboardHandlerForBottomConstraint(constraintToAnimate: constraintToAnimate, constraintOffset: constraintOffset, viewThatCanContainTextInputs: viewThatCanContainTextInputs!, viewToDismissKeyboardOnTap: viewToDismissKeyboardOnTap)
        weakSut = sut
        delegate = KeyboardHandlerDelegateSpy()
        sut.delegate = delegate
    }
    
    override func tearDown() {
        sut = nil
        delegate = nil
        viewThatCanContainTextInputs = nil
        viewToDismissKeyboardOnTap = nil
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
    
    func test_DidHideKeyboardEvent_DidCallDelegate() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .didHide)
        XCTAssertFalse(delegate.willShowKeyboardCalled)
        XCTAssertFalse(delegate.didShowKeyboardCalled)
        XCTAssertFalse(delegate.willHideKeyboardCalled)
        XCTAssertTrue(delegate.didHideKeyboardCalled)
        XCTAssertEqual(delegate.receivedHeight!, 100)
    }
    
    func test_DeallocationWhenSettingItselfAsDelegate_ToTapGestureRecognizerManager() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .willShow)
        sut = nil
        XCTAssertNil(weakSut)
    }
    
}
