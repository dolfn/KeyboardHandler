//
//  KeyboardHandlerForCenteringConstraint.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

public class KeyboardHandlerForCenteringConstraint: KeyboardHandler, KeyboardShowingOrHidingListener {
    
    public var tokens: [AnyObject]?
    private weak var constraint: NSLayoutConstraint?
    
    init(constraint: NSLayoutConstraint?) {
        self.constraint = constraint
    }
    
    public func handleKeyboard(withHeight keyboardHeight: CGFloat, keyboardStatus: KeyboardStatus) {
        let constraintOffsetValue = keyboardHeight / 2.0
        switch keyboardStatus {
        case .willShow:
             constraint?.constant += -constraintOffsetValue
        case .willHide:
            constraint?.constant += constraintOffsetValue
        default:
            break
        }
    }
    
    public func startListeningForShowingOrHidingTheKeyboard() {
//        let willHideToken = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main, using: { (notification) in
//            self.handleKeyboardNotification(notification, withKeyboardStatus: KeyboardStatus.willHide)
//        })
//
//        let willShowToken = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main, using: { (notification) in
//            self.handleKeyboardNotification(notification, withKeyboardStatus: KeyboardStatus.willShow)
//        })
//
//        let didHideToken = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidHide, object: nil, queue: OperationQueue.main, using: { (notification) in
//            self.handleKeyboardNotification(notification, withKeyboardStatus: KeyboardStatus.didHide)
//        })
//
//        let didShowToken = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow, object: nil, queue: OperationQueue.main, using: { (notification) in
//            self.handleKeyboardNotification(notification, withKeyboardStatus: KeyboardStatus.didShow)
//        })
//
//        if tokens == nil {
//            tokens = [AnyObject]()
//        }
//
//        tokens?.append(willHideToken)
//        tokens?.append(willShowToken)
//        tokens?.append(didHideToken)
//        tokens?.append(didShowToken)
    }
    
    public func stopListeningForShowingOrHidingKeyboard() {
//        if let tokens = tokens {
//            for token in tokens {
//                NotificationCenter.default.removeObserver(token)
//            }
//        }
//        tokens?.removeAll()
    }
    
    
    private func handleKeyboardNotification(_ notification: Notification, withKeyboardStatus keyboardStatus: KeyboardStatus) {
//        if let userInfo = (notification as NSNotification).userInfo {
//            let keyboardRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//            let keyboardHeight = keyboardRect!.height
//            self.handleKeyboard(withHeight: keyboardHeight, keyboardStatus: keyboardStatus)
//        }
    }
}
