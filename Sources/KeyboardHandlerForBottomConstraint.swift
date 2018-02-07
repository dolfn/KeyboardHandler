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
    public weak var viewToDismissKeyboardOnTap: UIView? {
        didSet {
            createTapGestureRecognizerManager(for: viewToDismissKeyboardOnTap)
        }
    }
    public weak var delegate: KeyboardHandlerDelegate?
    
    private weak var constraint: NSLayoutConstraint?
    private weak var activeTextInputView: UIView?
    
    public init(constraintToAnimate: NSLayoutConstraint, constraintOffset: CGFloat, viewThatCanContainTextInputs: UIView?, viewToDismissKeyboardOnTap: UIView?) {
        constraintDefaultConstant = constraintToAnimate.constant
        self.constraint = constraintToAnimate
        self.viewThatCanContainTextInputs = viewThatCanContainTextInputs
        self.viewToDismissKeyboardOnTap = viewToDismissKeyboardOnTap
        self.constraintOffset = constraintOffset
        createTapGestureRecognizerManager(for: viewToDismissKeyboardOnTap)
    }
    
    public func handleKeyboard(withHeight keyboardHeight: CGFloat, keyboardStatus: KeyboardStatus) {
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
    
    private func createTapGestureRecognizerManager(for view: UIView?) {
        if let view = view {
            tapGestureRecognizerManager = TapGestureRecognizerManager(viewToSetGestureRecognizerFor: view)
            tapGestureRecognizerManager?.delegate = self
        } else {
            tapGestureRecognizerManager = nil
        }
    }
    
}
