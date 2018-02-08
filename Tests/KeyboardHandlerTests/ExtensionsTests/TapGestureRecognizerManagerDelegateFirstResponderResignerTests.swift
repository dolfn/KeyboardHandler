//
//  TapGestureRecognizerManagerDelegateFirstResponderResignerTests.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import XCTest
@testable import KeyboardHandler

class TapGestureRecognizerManagerDelegateFirstResponderResignerTests: XCTestCase {
    
    private var sut: TapGestureRecognizerManagerDelegateFirstResponderResignerMock!
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
        XCTAssertEqual(view.gestureRecognizers?.count, 1)
        sut.gestureRecognizerManagerDidTapOnView(tapGestureRecognizerManager!)
        XCTAssertTrue(textField.resignFirstResponderCalled)
        XCTAssertEqual(view.gestureRecognizers?.count, 0)
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
        XCTAssertEqual(view.gestureRecognizers?.count, 1)
        textView.shouldExpectTheFunctionCall = true
        sut.gestureRecognizerManagerDidTapOnView(tapGestureRecognizerManager!)
        textView.shouldExpectTheFunctionCall = false
        XCTAssertEqual(view.gestureRecognizers?.count, 0)
        XCTAssertTrue(textView.didAskIfItIsFirstResponder)
        XCTAssertTrue(textView.didCallResignFirstResponder)
    }
    
    func test_RemoveTapGestureRecognizer_EvenIfNowFirstResponderSubviewFound() {
        let view = UIView()
        viewsReferences.append(view)
        let view2 = UIView()
        view2.addSubview(view)
        viewsReferences.append(view2)
        sut = TapGestureRecognizerManagerDelegateFirstResponderResignerMock()
        sut.viewThatCanContainTextInputs = view2
        tapGestureRecognizerManager = TapGestureRecognizerManager(viewToSetGestureRecognizerFor: view)
        XCTAssertEqual(view.gestureRecognizers?.count, 1)
        sut.gestureRecognizerManagerDidTapOnView(tapGestureRecognizerManager!)
        XCTAssertEqual(view.gestureRecognizers?.count, 0)
    }
    
    func test_FindFirstResponderView_InAComplexHierarcy() {
        let view1 = UIView()
        viewsReferences.append(view1)
        let view2 = UIView()
        viewsReferences.append(view2)
        let view3 = UIView()
        viewsReferences.append(view3)
        view3.addSubview(view2)
        view2.addSubview(view1)
        
        
        let view4 = UIView()
        viewsReferences.append(view4)
        let view5 = UIView()
        viewsReferences.append(view5)
        let view6 = UIView()
        viewsReferences.append(view6)
        view6.addSubview(view5)
        view5.addSubview(view4)
        
        let textView = UITextViewSpy()
        view2.addSubview(textView)
        
        let containerView = UIView()
        viewsReferences.append(containerView)
        containerView.addSubview(view3)
        containerView.addSubview(view6)
        
        sut = TapGestureRecognizerManagerDelegateFirstResponderResignerMock()
        sut.viewThatCanContainTextInputs = containerView
        textView.shouldExpectTheFunctionCall = true
        tapGestureRecognizerManager = TapGestureRecognizerManager(viewToSetGestureRecognizerFor: containerView)
        sut.gestureRecognizerManagerDidTapOnView(tapGestureRecognizerManager!)
        textView.shouldExpectTheFunctionCall = false
        XCTAssertTrue(textView.didCallResignFirstResponder)
    }
    
}
