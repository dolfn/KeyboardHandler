//
//  KeyboardHandlerKeyboardShowingOrHidingListener.swift
//  KeyboardHandler-iOS
//
//  Created by Andrei Nastasiu on 05/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

public extension KeyboardShowingOrHidingListener where Self: KeyboardHandler {
    
    public func startListeningForShowingOrHidingTheKeyboard() {
        let hideToken = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main, using: { (notification) in
            self.handleKeyboardNotification(notification, withKeyboardStatus: KeyboardStatus.hiding)
        })
        
        let showToken = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main, using: { (notification) in
            self.handleKeyboardNotification(notification, withKeyboardStatus: KeyboardStatus.showing)
        })
        if tokens == nil {
            tokens = [AnyObject]()
        }
        tokens?.append(hideToken)
        tokens?.append(showToken)
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
