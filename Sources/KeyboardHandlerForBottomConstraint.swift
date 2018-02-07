//
//  KeyboardHandlerForBottomConstraint.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import UIKit

public class KeyboardHandlerForBottomConstraint: KeyboardHandler, KeyboardShowingOrHidingListener, TapGestureRecognizerManagerDelegate, FirstResponderResigner {
    
    var tapGestureRecognizerManager: TapGestureRecognizerManager?
    public var constraintDefaultConstant: CGFloat = 0
    public var constraintOffset: CGFloat = 0
    public var tokens: [AnyObject]?
    public weak var viewThatCanContainTextInputs: UIView?
    public weak var delegate: KeyboardHandlerDelegate?
    
    private weak var constraint: NSLayoutConstraint?
    private weak var viewToDismissKeyboardOnTap: UIView?
    private weak var activeTextInputView: UIView?
    
    public init(constraintToAnimate: NSLayoutConstraint, constraintOffset: CGFloat, viewThatCanContainTextInputs: UIView?, viewToDismissKeyboardOnTap: UIView?) {
        self.constraint = constraintToAnimate
        constraintDefaultConstant = constraintToAnimate.constant
        self.viewThatCanContainTextInputs = viewThatCanContainTextInputs
        self.viewToDismissKeyboardOnTap = viewToDismissKeyboardOnTap
        self.constraintOffset = constraintOffset
    }
    
    public func handleKeyboard(withHeight keyboardHeight: CGFloat, keyboardStatus: KeyboardStatus) {
        if let viewToDismissKeyboardOnTap = viewToDismissKeyboardOnTap {
            tapGestureRecognizerManager = TapGestureRecognizerManager(viewToSetGestureRecognizerFor: viewToDismissKeyboardOnTap)
            tapGestureRecognizerManager?.delegate = self
        }

        switch keyboardStatus {
        case .willShow:
            delegate?.willShowKeyboard(height: keyboardHeight)
            constraint?.constant = keyboardHeight + constraintOffset
        case .didShow:
            delegate?.didShowKeyboard(height: keyboardHeight)
        case .willHide:
            delegate?.willHideKeyboard(height: keyboardHeight)
            constraint?.constant = constraintDefaultConstant
        case .didHide:
            delegate?.didHideKeyboard(height: keyboardHeight)
        }
    }
    
}
