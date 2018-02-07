//
//  KeyboardHandlerForCenteringConstraint.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

public class KeyboardHandlerForCenteringConstraint: KeyboardHandler, KeyboardShowingOrHidingListener {
    
    public var tokens: [AnyObject]?
    public weak var delegate: KeyboardHandlerDelegate?
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
        case .didShow:
            delegate?.didShowKeyboard(height: keyboardHeight)
        default:
            break
        }
    }

}
