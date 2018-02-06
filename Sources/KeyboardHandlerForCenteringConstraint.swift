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
        
    private func handleKeyboardNotification(_ notification: Notification, withKeyboardStatus keyboardStatus: KeyboardStatus) {
//        if let userInfo = (notification as NSNotification).userInfo {
//            let keyboardRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//            let keyboardHeight = keyboardRect!.height
//            self.handleKeyboard(withHeight: keyboardHeight, keyboardStatus: keyboardStatus)
//        }
    }
}
