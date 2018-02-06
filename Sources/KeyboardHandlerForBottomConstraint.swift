//
//  KeyboardHandlerForBottomConstraint.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import UIKit

public class KeyboardHandlerForBottomConstraint: KeyboardHandler, KeyboardShowingOrHidingListener, TapGestureRecognizerManagerDelegate {
    
    fileprivate weak var constraint: NSLayoutConstraint?
    var constraintDefaultConstant: CGFloat = 0
    var constraintOffset: CGFloat = 0
    public var tokens: [AnyObject]?
    public weak var delegate: KeyboardHandlerDelegate?
    
    fileprivate var tapGestureRecognizerManager: TapGestureRecognizerManager?
    fileprivate weak var viewToDismissKeyboardOnTap: UIView?
    fileprivate weak var viewThatCanContainTextInputs: UIView?
    fileprivate weak var activeTextInputView: UIView?
    
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
        default: break
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
    
    fileprivate func findActiveTextInput(_ viewsToLookIntoForTextField: [UIView]) {
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
