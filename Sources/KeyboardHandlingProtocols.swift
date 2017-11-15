//
//  KeyboardDisplayHandler.swift
//  MoneyMiles
//
//  Created by Corneliu on 13/06/16.
//  Copyright © 2016 Dolfn. All rights reserved.
//

import Foundation
import UIKit


public enum KeyboardStatus {
    case showing, hiding
}

public protocol KeyboardShowingOrHidingListener: class {
    var tokens: [AnyObject]? { get set }
    func startListeningForShowingOrHidingTheKeyboard()
    func stopListeningForShowingOrHidingKeyboard()
}

protocol KeyboardHandlerDelegate: class {
    func didShowKeyboard(_ keyboardHeight: CGFloat)
}

public protocol KeyboardHandler {
    func handleKeyboard(withHeight keyboardHeight: CGFloat, keyboardStatus: KeyboardStatus)
}

protocol KeyboardFirstResponder {
    var isTextInputFirstResponder: Bool { get }
}

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
