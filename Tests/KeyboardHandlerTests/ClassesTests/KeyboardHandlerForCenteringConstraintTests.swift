//
//  KeyboardHandlerForCenteringConstraintTests.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import XCTest
@testable import KeyboardHandler

class KeyboardHandlerForCenteringConstraintTests: XCTestCase {
    
    private var constraint: NSLayoutConstraint!
    private var sut: KeyboardHandlerForCenteringConstraint!
    private var viewToDismissKeyboardOnTap: UIView!
    private weak var firstTapGestureRecognizerManagerReference: TapGestureRecognizerManager!
    private weak var secondTapGestureRecognizerManagerReference: TapGestureRecognizerManager!
        
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
    
    func test_DeallocatingSUT_IsRemovingTapGestureRecognizerFromGivenView() {
        sut.viewToDismissKeyboardOnTap = viewToDismissKeyboardOnTap
        sut = nil
        XCTAssertEqual(viewToDismissKeyboardOnTap?.gestureRecognizers?.count, 0)
    }
    
    func test_CallingHandleKeyboardMultipleTimes_UsesTheSameInstanceOfTapGestureRecognizerManager() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .willShow)
        firstTapGestureRecognizerManagerReference = sut.tapGestureRecognizerManager
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .willShow)
        secondTapGestureRecognizerManagerReference = sut.tapGestureRecognizerManager
        XCTAssertTrue(firstTapGestureRecognizerManagerReference === secondTapGestureRecognizerManagerReference)
    }
    
    func test_GivenUIViewsToSUT_AreKeepedAsWeekReferences() {
        var viewThatCanContainTextInputs: UIView? = UIView()
        sut.viewThatCanContainTextInputs = viewThatCanContainTextInputs
        var viewToDismissKeyboardOnTap: UIView? = UIView()
        sut.viewToDismissKeyboardOnTap = viewToDismissKeyboardOnTap
        
        viewThatCanContainTextInputs = nil
        viewToDismissKeyboardOnTap = nil
        
        XCTAssertNil(sut.viewToDismissKeyboardOnTap)
        XCTAssertNil(sut.viewThatCanContainTextInputs)
    }
    
    func test_GivenOtherViewControllerToHandleTaps_RecreateTapGestureRecognizerManager() {
        firstTapGestureRecognizerManagerReference = sut.tapGestureRecognizerManager
        sut.viewToDismissKeyboardOnTap = UIView()
        XCTAssertFalse(firstTapGestureRecognizerManagerReference === sut.tapGestureRecognizerManager)
    }
    
    func test_AtAllocation_CreatedTapGestureRecognizerManagerForGivenView() {
        XCTAssertNotNil(sut.tapGestureRecognizerManager)
    }
    
    func test_WhenGivenNilWiewToDismissKeyboardOnTap_DeallocatedTapGestureRecognizerManager() {
        sut.viewToDismissKeyboardOnTap = nil
        XCTAssertNil(sut.tapGestureRecognizerManager)
    }
    
}
