//
//  TapGestureRecognizerManagerTests.swift
//  KeyboardHandler-iOS Tests
//
//  Created by Andrei Nastasiu on 06/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import KeyboardHandler

class TapGestureRecognizerManagerTests: XCTestCase {
    
    var sut: TapGestureRecognizerManager!
    var view: UIView!
    
    override func setUp() {
        super.setUp()
        view = UIView()
        sut = TapGestureRecognizerManager(viewToSetGestureRecognizerFor: view)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        view = nil
    }
    
    func test_GivenViewAtInitialization_IsSavedAsProperty() {
        XCTAssertEqual(sut.viewToSetGestureRecognizerFor, view)
    }
    
    func test_GivenViewAtInitialization_IsReatinedAsWeakReference() {
        view = nil
        wait(for: 0.1)
        XCTAssertNil(sut.viewToSetGestureRecognizerFor)
    }
    
    func test_AtInitialization_IsAddingTapGestureForGivenView() {
        wait(for: 0.1)
        XCTAssertEqual(view.gestureRecognizers!.count, 1)
        let gestureRecognizer = view.gestureRecognizers!.first
        XCTAssertTrue(gestureRecognizer is UITapGestureRecognizer)
    }
    
    func test_AtDellocation_IsRemovingTapGestureForGivenView() {
        wait(for: 0.1)
        sut = nil
        XCTAssertEqual(view.gestureRecognizers!.count, 0)
    }
    
    func test_WhenCallingRemoveTapGesture_RemoveTapGestureFromGivenView() {
        wait(for: 0.1)
        sut.removeGestureRecognizer()
        XCTAssertEqual(view.gestureRecognizers!.count, 0)
    }
    
    func test_HandleDidTapFunction_WillCallTheDelegateFunction() {
        let delegate = TapGestureRecognizerManagerDelegateSpy()
        sut.delegate = delegate
        sut.gestureRecognizerDidTap(UITapGestureRecognizer())
        XCTAssertTrue(delegate.tapGestureRecognizerManager === sut)
    }
}

