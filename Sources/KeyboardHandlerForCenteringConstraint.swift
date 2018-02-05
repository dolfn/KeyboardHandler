//
//  KeyboardHandlerForCenteringConstraint.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

public class KeyboardHandlerForCenteringConstraint: KeyboardHandler, KeyboardShowingOrHidingListener {
    
    fileprivate weak var constraint: NSLayoutConstraint?
    public var tokens: [AnyObject]?
    
    init(constraint: NSLayoutConstraint?) {
        self.constraint = constraint
    }
    
    public func handleKeyboard(withHeight keyboardHeight: CGFloat, keyboardStatus: KeyboardStatus) {
        let constraintOffsetValue = keyboardHeight / 2.0
        constraint?.constant += keyboardStatus == .showing ? -constraintOffsetValue : constraintOffsetValue
    }
}
