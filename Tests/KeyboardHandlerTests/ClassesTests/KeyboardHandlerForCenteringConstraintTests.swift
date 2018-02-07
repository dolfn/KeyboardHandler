//
//  KeyboardHandlerForCenteringConstraintTests.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import XCTest
@testable import KeyboardHandler

class KeyboardHandlerForCenteringConstraintTests: XCTestCase {
    
    var constraint: NSLayoutConstraint!
    var sut: KeyboardHandlerForCenteringConstraint!
    var viewToDismissKeyboardOnTap: UIView!
    
    override func setUp() {
        super.setUp()
        constraint = NSLayoutConstraint()
        constraint.constant = 100
        viewToDismissKeyboardOnTap = UIView()
        sut = KeyboardHandlerForCenteringConstraint(constraint: constraint, viewThatCanContainTextInputs: UIView(), viewToDismissKeyboardOnTap: viewToDismissKeyboardOnTap)
    }
    
    override func tearDown() {
        constraint = nil
        sut = nil
        viewToDismissKeyboardOnTap = nil
        super.tearDown()
    }
    
    func test_ShowingKeyboard_DecreaseConstraintValueWithHalfOfTheKeyboardValue() {
        sut.handleKeyboard(withHeight: 600, keyboardStatus: .willShow)
        XCTAssertEqual(constraint.constant, -200)
    }
    
    func test_HidingKeyboard_DecreaseConstraintValueWithHalfOfTheKeyboardValue() {
        constraint.constant = -200
        sut.handleKeyboard(withHeight: 600, keyboardStatus: .willHide)
        XCTAssertEqual(constraint.constant, 100)
    }
    
    func test_DidShowKeyboard_DoNotChangeTheValueOfConstraint() {
        sut.handleKeyboard(withHeight: 600, keyboardStatus: .didShow)
        XCTAssertEqual(constraint.constant, 100)
    }
    
    func test_DidHideKeyboard_DoNotChangeTheValueOfConstraint() {
        sut.handleKeyboard(withHeight: 600, keyboardStatus: .didHide)
        XCTAssertEqual(constraint.constant, 100)
    }
    
    func test_CallingHandleKeybords_AddsTapGestureRecognizer() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .willShow)
        XCTAssertNotNil(sut.tapGestureRecognizerManager)
        XCTAssertEqual(viewToDismissKeyboardOnTap?.gestureRecognizers?.count, 1)
        XCTAssertEqual(sut.tapGestureRecognizerManager?.viewToSetGestureRecognizerFor, viewToDismissKeyboardOnTap)
    }
    
    func test_DeallocatingSUT_IsRemovingTapGestureRecognizerFromGivenView() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .willShow)
        sut = nil
        XCTAssertEqual(viewToDismissKeyboardOnTap?.gestureRecognizers?.count, 0)
    }
}
