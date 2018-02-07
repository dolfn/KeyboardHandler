//
//  TapGestureRecognizerManagerDelegateFirstResponderResignerTests.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import XCTest
@testable import KeyboardHandler

class TapGestureRecognizerManagerDelegateFirstResponderResignerTests: XCTestCase {
    
    var sut: TapGestureRecognizerManagerDelegateFirstResponderResignerMock!
    private var viewsReferences = [UIView]()
    private var tapGestureRecognizerManager: TapGestureRecognizerManager!
    
    override func setUp() {
        sut = TapGestureRecognizerManagerDelegateFirstResponderResignerMock()
    }
    
    override func tearDown() {
        viewsReferences.removeAll()
        tapGestureRecognizerManager = nil
        sut = nil
        super.tearDown()
    }
    func test_HandleUserTapFromViewWithTextFieldSubview_IsRemovingTapGesture() {
        let textField = UITextFieldSpy()
        let view = UIView()
        view.addSubview(textField)
        viewsReferences.append(view)
        let view2 = UIView()
        view2.addSubview(textField)
        viewsReferences.append(view2)
        sut = TapGestureRecognizerManagerDelegateFirstResponderResignerMock()
        sut.viewThatCanContainTextInputs = view2
        tapGestureRecognizerManager = TapGestureRecognizerManager(viewToSetGestureRecognizerFor: view)
        XCTAssertEqual(view.gestureRecognizers!.count, 1)
        sut.gestureRecognizerManagerDidTapOnView(tapGestureRecognizerManager!)
        XCTAssertTrue(textField.resignFirstResponderCalled)
        XCTAssertEqual(view.gestureRecognizers!.count, 0)
        XCTAssertTrue(textField.didAskIfItIsFirstResponder)
    }
    
    func test_HandleUserTapFromViewWithTextViewSubview_IsRemovingTapGesture() {
        let textView = UITextViewSpy()
        let view = UIView()
        view.addSubview(textView)
        viewsReferences.append(view)
        let view2 = UIView()
        view2.addSubview(textView)
        viewsReferences.append(view2)
        sut = TapGestureRecognizerManagerDelegateFirstResponderResignerMock()
        sut.viewThatCanContainTextInputs = view2
        tapGestureRecognizerManager = TapGestureRecognizerManager(viewToSetGestureRecognizerFor: view)
        XCTAssertEqual(view.gestureRecognizers!.count, 1)
        textView.shouldExpectTheFunctionCall = true
        sut.gestureRecognizerManagerDidTapOnView(tapGestureRecognizerManager!)
        textView.shouldExpectTheFunctionCall = false
        XCTAssertEqual(view.gestureRecognizers!.count, 0)
        XCTAssertTrue(textView.didAskIfItIsFirstResponder)
        XCTAssertTrue(textView.didCallResignFirstResponder)
    }
    
}
