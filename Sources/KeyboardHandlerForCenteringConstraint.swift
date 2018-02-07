//
//  KeyboardHandlerForCenteringConstraint.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

public class KeyboardHandlerForCenteringConstraint: KeyboardHandler, KeyboardShowingOrHidingListener, TapGestureRecognizerManagerDelegate, FirstResponderResigner {
    
    var tapGestureRecognizerManager: TapGestureRecognizerManager?
    public var tokens: [AnyObject]?
    public weak var viewThatCanContainTextInputs: UIView?
    public weak var viewToDismissKeyboardOnTap: UIView? {
        didSet {
            createTapGestureRecognizerManager(for: viewToDismissKeyboardOnTap)
        }
    }
    public weak var delegate: KeyboardHandlerDelegate?
    
    private weak var constraint: NSLayoutConstraint?
    
    public init(constraint: NSLayoutConstraint, viewThatCanContainTextInputs: UIView?, viewToDismissKeyboardOnTap: UIView?) {
        self.constraint = constraint
        self.viewThatCanContainTextInputs = viewThatCanContainTextInputs
        self.viewToDismissKeyboardOnTap = viewToDismissKeyboardOnTap
        createTapGestureRecognizerManager(for: viewToDismissKeyboardOnTap)
    }
    
    public func handleKeyboard(withHeight keyboardHeight: CGFloat, keyboardStatus: KeyboardStatus) {
        let constraintOffsetValue = keyboardHeight / 2.0
        switch keyboardStatus {
        case .willShow:
            constraint?.constant -= constraintOffsetValue
            delegate?.willShowKeyboard(height: keyboardHeight)
        case .willHide:
            constraint?.constant += constraintOffsetValue
            delegate?.willHideKeyboard(height: keyboardHeight)
        case .didShow:
            delegate?.didShowKeyboard(height: keyboardHeight)
        case .didHide:
            delegate?.didHideKeyboard(height: keyboardHeight)
        }
    }
    
    private func createTapGestureRecognizerManager(for view: UIView?) {
        if let view = view {
            tapGestureRecognizerManager = TapGestureRecognizerManager(viewToSetGestureRecognizerFor: view)
            tapGestureRecognizerManager?.delegate = self
        }
    }

}
