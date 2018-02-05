//
//  KeyboardHandlerKeyboardShowingOrHidingListener.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

public extension KeyboardShowingOrHidingListener where Self: KeyboardHandler {
    
    public func startListeningForShowingOrHidingTheKeyboard() {
        let willHideToken = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main, using: { (notification) in
            self.handleKeyboardNotification(notification, withKeyboardStatus: KeyboardStatus.willHide)
        })
        
        let willShowToken = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main, using: { (notification) in
            self.handleKeyboardNotification(notification, withKeyboardStatus: KeyboardStatus.willShow)
        })
        
        let didHideToken = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidHide, object: nil, queue: OperationQueue.main, using: { (notification) in
            self.handleKeyboardNotification(notification, withKeyboardStatus: KeyboardStatus.didHide)
        })
        
        let didShowToken = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow, object: nil, queue: OperationQueue.main, using: { (notification) in
            self.handleKeyboardNotification(notification, withKeyboardStatus: KeyboardStatus.didShow)
        })
        
        if tokens == nil {
            tokens = [AnyObject]()
        }
        
        tokens?.append(willHideToken)
        tokens?.append(willShowToken)
        tokens?.append(didHideToken)
        tokens?.append(didShowToken)
    }
    
    public func stopListeningForShowingOrHidingKeyboard() {
        if let tokens = tokens {
            for token in tokens {
                NotificationCenter.default.removeObserver(token)
            }
        }
        tokens?.removeAll()
    }
    
    
    fileprivate func handleKeyboardNotification(_ notification: Notification, withKeyboardStatus keyboardStatus: KeyboardStatus) {
        if let userInfo = (notification as NSNotification).userInfo {
            let keyboardRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let keyboardHeight = keyboardRect!.height
            self.handleKeyboard(withHeight: keyboardHeight, keyboardStatus: keyboardStatus)
        }
    }
}
