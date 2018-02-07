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
    
    var constraint: NSLayoutConstraint!
    var sut: KeyboardHandlerForCenteringConstraint!
    var observerReceiver: ObserverReceiverSpy!
    var delegate: KeyboardHandlerDelegateSpy!
    var notification: Notification!
    
    override func setUp() {
        super.setUp()
        constraint = NSLayoutConstraint()
        constraint.constant = 100
        sut = KeyboardHandlerForCenteringConstraint(constraint: constraint)
        observerReceiver = ObserverReceiverSpy()
        sut.startListeningForKeyboardEvents(in: observerReceiver)
        delegate = KeyboardHandlerDelegateSpy()
        sut.delegate = delegate
        let userInfo = [UIKeyboardFrameEndUserInfoKey: CGRect(x: 0, y: 0, width: 400, height: 300)]
        notification = Notification(name: NSNotification.Name.UIKeyboardWillHide, object: nil, userInfo: userInfo)
    }
    
    override func tearDown() {
        constraint = nil
        sut = nil
        observerReceiver = nil
        delegate = nil
        notification = nil
        super.tearDown()
    }
    
    func test_StartListeningForKeyboardEvents_AddKeybordNotificationsTokens() {
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
        let function = observerReceiver.pairredNotificationsWithBlocks[NSNotification.Name.UIKeyboardWillShow]
        function?(notification)
        XCTAssertEqual(constraint.constant, -50)
    }
    
    func test_CallingWillHideKeyboardCompletion_ProvidesGivenKeyboardRectToDelegate() {
        let function = observerReceiver.pairredNotificationsWithBlocks[NSNotification.Name.UIKeyboardWillHide]
        function?(notification)
        XCTAssertEqual(constraint.constant, 250)
    }
    
    func test_CallingWillShowKeyboardCompletion_CallsGivenDelegateWillShowKeyboardFunction() {
        let function = observerReceiver.pairredNotificationsWithBlocks[NSNotification.Name.UIKeyboardWillShow]
        function?(notification)
        XCTAssertTrue(delegate.willShowKeyboardCalled)
    }
    
    func test_CallingDidShowKeyboardCompletion_CallsGivenDelegateDidShowKeyboardFunction() {
        let function = observerReceiver.pairredNotificationsWithBlocks[NSNotification.Name.UIKeyboardDidShow]
        function?(notification)
        XCTAssertTrue(delegate.didShowKeyboardCalled)
    }
    
    func test_CallingWillHideKeyboardCompletion_CallsGivenDelegateWillHideKeyboardFunction() {
        let function = observerReceiver.pairredNotificationsWithBlocks[NSNotification.Name.UIKeyboardWillHide]
        function?(notification)
        XCTAssertTrue(delegate.willHideKeyboardCalled)
    }
    
    func test_CallingDidHideKeyboardCompletion_CallsGivenDelegateDidHideKeyboardFunction() {
        let function = observerReceiver.pairredNotificationsWithBlocks[NSNotification.Name.UIKeyboardDidHide]
        function?(notification)
        XCTAssertTrue(delegate.didHideKeyboardCalled)
    }
    
    func test_StopListeningForKeyboardEvents_RemoveAllTokensFromObserverReceiver() {
        let addedObservers = sut.tokens!
        var removedObserversFromAddedOnes = 0
        sut.stopListeningForKeyboardEvents(in: observerReceiver)
        XCTAssertEqual(observerReceiver.removedObservers.count, 4)
        for anAddedObserver in addedObservers {
            let found = observerReceiver.removedObservers.contains(where: { (anRemovedObserver) -> Bool in
                if anRemovedObserver as AnyObject === anAddedObserver {
                    return true
                }
                return false
            })
            
            if found {
                removedObserversFromAddedOnes += 1
            }
        }
        XCTAssertEqual(removedObserversFromAddedOnes, 4)
    }
    
    func test_StopListeningForKeyboardEvents_RemoveAllTokensFromSUT() {
        sut.stopListeningForKeyboardEvents(in: observerReceiver)
        XCTAssertEqual(sut.tokens!.count, 0)
    }
}
