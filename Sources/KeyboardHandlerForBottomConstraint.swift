//
//  KeyboardHandlerForBottomConstraint.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import UIKit

public class KeyboardHandlerForBottomConstraint: KeyboardHandler, KeyboardShowingOrHidingListener, TapGestureRecognizerManagerDelegate {
    
    var constraintDefaultConstant: CGFloat = 0
    var constraintOffset: CGFloat = 0
    public var tokens: [AnyObject]?
    public weak var delegate: KeyboardHandlerDelegate?
    
    private var tapGestureRecognizerManager: TapGestureRecognizerManager?
    private weak var constraint: NSLayoutConstraint?
    private weak var viewToDismissKeyboardOnTap: UIView?
    private weak var viewThatCanContainTextInputs: UIView?
    private weak var activeTextInputView: UIView?
    
    public init(constraintToAnimate: NSLayoutConstraint, viewThatCanContainTextInputs: UIView?, viewToDismissKeyboardOnTap: UIView?) {
//        self.constraint = constraintToAnimate
//        constraintDefaultConstant = constraintToAnimate.constant
//        self.viewThatCanContainTextInputs = viewThatCanContainTextInputs
//        self.viewToDismissKeyboardOnTap = viewToDismissKeyboardOnTap
    }
    
    public init(constraintToAnimate: NSLayoutConstraint, constraintOffset: CGFloat, viewThatCanContainTextInputs: UIView, viewToDismissKeyboardOnTap: UIView?) {
//        self.constraint = constraintToAnimate
//        constraintDefaultConstant = constraintToAnimate.constant
//        self.viewThatCanContainTextInputs = viewThatCanContainTextInputs
//        self.viewToDismissKeyboardOnTap = viewToDismissKeyboardOnTap
//        self.constraintOffset = constraintOffset
    }
    
    public func handleKeyboard(withHeight keyboardHeight: CGFloat, keyboardStatus: KeyboardStatus) {
//        constraint?.constant = keyboardStatus == .willShow ? (keyboardHeight + constraintOffset) : constraintDefaultConstant
//
//
//        if let viewToDismissKeyboardOnTap = viewToDismissKeyboardOnTap {
//            tapGestureRecognizerManager = TapGestureRecognizerManager(viewToSetGestureRecognizerFor: viewToDismissKeyboardOnTap)
//            tapGestureRecognizerManager!.delegate = self
//        }
//        else {
//            tapGestureRecognizerManager = nil
//        }
//
        switch keyboardStatus {
        case .willShow:
            delegate?.willShowKeyboard(height: keyboardHeight)
        case .didShow:
            delegate?.didShowKeyboard(height: keyboardHeight)
        case .willHide:
            delegate?.willHideKeyboard(height: keyboardHeight)
        case .didHide:
            delegate?.didHideKeyboard(height: keyboardHeight)
        }
    }
    
    func gestureRecognizerManagerDidTapOnView(_ tapGestureRecognizerManager: TapGestureRecognizerManager) {
//        if let viewThatCanContainTextInputs = viewThatCanContainTextInputs{
//            findActiveTextInput([viewThatCanContainTextInputs])
//            activeTextInputView?.resignFirstResponder()
//            tapGestureRecognizerManager.removeGestureRecognizer()
//            self.tapGestureRecognizerManager = nil
//        }
    }
    
    deinit {
//        tapGestureRecognizerManager?.removeGestureRecognizer()
//        tapGestureRecognizerManager = nil
    }
    
    private func findActiveTextInput(_ viewsToLookIntoForTextField: [UIView]) {
//        for subview in viewsToLookIntoForTextField {
//            if let textField = subview as? UITextField , textField.isFirstResponder {
//                activeTextInputView = textField
//            }
//            else if let textView = subview as? UITextView , textView.isFirstResponder {
//                activeTextInputView = textView
//            }
//            else {
//                findActiveTextInput(subview.subviews)
//            }
//        }
    }
}
