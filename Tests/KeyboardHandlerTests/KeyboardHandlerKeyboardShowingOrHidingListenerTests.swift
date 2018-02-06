//
//  KeyboardHandlerKeyboardShowingOrHidingListenerTests.swift
//  KeyboardHandler-iOS Tests
//
//  Created by Andrei Nastasiu on 06/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import XCTest
@testable import KeyboardHandler

class KeyboardHandlerKeyboardShowingOrHidingListenerTests: XCTestCase {
    
    func test_StartListening_AddKeybordNotificationsTokens() {
        let sut = KeyboardHandlerForCenteringConstraint(constraint: NSLayoutConstraint())
        let observerReceiver: ObserverReceiverSpy = ObserverReceiverSpy()
        sut.startListeningForKeyboardEvents(in: observerReceiver)
        XCTAssertEqual(observerReceiver.names.count, 4)
        XCTAssertEqual(observerReceiver.objs.count, 0)
        XCTAssertEqual(observerReceiver.blocks.count, 4)
        XCTAssertEqual(observerReceiver.queues.count, 4)
        XCTAssertTrue(observerReceiver.names.contains(NSNotification.Name.UIKeyboardWillShow))
        XCTAssertTrue(observerReceiver.names.contains(NSNotification.Name.UIKeyboardDidShow))
        XCTAssertTrue(observerReceiver.names.contains(NSNotification.Name.UIKeyboardWillHide))
        XCTAssertTrue(observerReceiver.names.contains(NSNotification.Name.UIKeyboardDidHide))
        XCTAssertEqual(observerReceiver.queues[0], OperationQueue.main)
        XCTAssertEqual(observerReceiver.queues[1], OperationQueue.main)
        XCTAssertEqual(observerReceiver.queues[2], OperationQueue.main)
        XCTAssertEqual(observerReceiver.queues[3], OperationQueue.main)
    }
    
    func test_CallingWillShowKeyboardCompletion_ProvidesGivenKeyboardRectToDelegate() {
        let constraint = NSLayoutConstraint()
        constraint.constant = 100
        let sut = KeyboardHandlerForCenteringConstraint(constraint: constraint)
        let observerReceiver: ObserverReceiverSpy = ObserverReceiverSpy()
        sut.startListeningForKeyboardEvents(in: observerReceiver)
        let function = observerReceiver.pairredNotificationsWithBlocks[NSNotification.Name.UIKeyboardWillShow]
        let userInfo = [UIKeyboardFrameEndUserInfoKey: CGRect(x: 0, y: 0, width: 400, height: 300)]
        let notification = Notification(name: NSNotification.Name.UIKeyboardWillShow, object: nil, userInfo: userInfo)
        function?(notification)
        XCTAssertEqual(constraint.constant, -50)
    }
}
