//
//  KeyboardHandlerForBottomConstraintTests.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import XCTest
@testable import KeyboardHandler

class KeyboardHandlerForBottomConstraintTests: XCTestCase {

    private var sut: KeyboardHandlerForBottomConstraint!
    private var delegate: KeyboardHandlerDelegateSpy!
    private var viewThatCanContainTextInputs: UIView!
    private var viewToDismissKeyboardOnTap: UIView!
    private var constraintToAnimate: NSLayoutConstraint!
    private weak var weakSut: KeyboardHandlerForBottomConstraint!
    private weak var firstTapGestureRecognizerManagerReference: TapGestureRecognizerManager!
    private weak var secondTapGestureRecognizerManagerReference: TapGestureRecognizerManager!
    
    override func setUp() {
        super.setUp()
        let constraintOffset: CGFloat = 10
        constraintToAnimate = NSLayoutConstraint()
        constraintToAnimate.constant = 50
        viewThatCanContainTextInputs = UIView()
        viewToDismissKeyboardOnTap = UIView()
        sut = KeyboardHandlerForBottomConstraint(constraintToAnimate: constraintToAnimate, constraintOffset: constraintOffset, viewThatCanContainTextInputs: viewThatCanContainTextInputs!, viewToDismissKeyboardOnTap: viewToDismissKeyboardOnTap!)
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
        XCTAssertEqual(delegate.receivedHeight, 100)
    }
    
    func test_DidShowKeyboardEvent_DidCallDelegate() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .didShow)
        XCTAssertFalse(delegate.willShowKeyboardCalled)
        XCTAssertTrue(delegate.didShowKeyboardCalled)
        XCTAssertFalse(delegate.willHideKeyboardCalled)
        XCTAssertFalse(delegate.didHideKeyboardCalled)
        XCTAssertEqual(delegate.receivedHeight, 100)
    }
    
    func test_WillHideKeyboardEvent_DidCallDelegate() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .willHide)
        XCTAssertFalse(delegate.willShowKeyboardCalled)
        XCTAssertFalse(delegate.didShowKeyboardCalled)
        XCTAssertTrue(delegate.willHideKeyboardCalled)
        XCTAssertFalse(delegate.didHideKeyboardCalled)
        XCTAssertEqual(delegate.receivedHeight, 100)
    }
    
    func test_DidHideKeyboardEvent_DidCallDelegate() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .didHide)
        XCTAssertFalse(delegate.willShowKeyboardCalled)
        XCTAssertFalse(delegate.didShowKeyboardCalled)
        XCTAssertFalse(delegate.willHideKeyboardCalled)
        XCTAssertTrue(delegate.didHideKeyboardCalled)
        XCTAssertEqual(delegate.receivedHeight, 100)
    }
    
    func test_DeallocationWhenSettingItselfAsDelegate_ToTapGestureRecognizerManager() {
        sut.handleKeyboard(withHeight: 100, keyboardStatus: .willShow)
        sut = nil
        XCTAssertNil(weakSut)
    }
    
    func test_WhenCallingWillShowKeyboard_ChangeConstraintValueIncludingOffsetAndKeyboardHeight() {
        sut.handleKeyboard(withHeight: 300, keyboardStatus: .willShow)
        XCTAssertEqual(constraintToAnimate.constant, 310)
    }
    
    func test_WhenCallingWillHideKeyboard_ChangeConstraintValueIncludingOffsetAndKeyboardHeight() {
        sut.handleKeyboard(withHeight: 300, keyboardStatus: .willHide)
        XCTAssertEqual(constraintToAnimate.constant, 50)
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
        sut.viewToDismissKeyboardOnTap = viewThatCanContainTextInputs
        XCTAssertFalse(firstTapGestureRecognizerManagerReference === sut.tapGestureRecognizerManager)
    }
    
    func test_AtAllocation_CreatedTapGestureRecognizerManagerForGivenView() {
        XCTAssertNotNil(sut.tapGestureRecognizerManager)
    }
}
