//
//  TapGestureRecognizerManagerDelegateFirstResponderResigner.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

extension TapGestureRecognizerManagerDelegate where Self: FirstResponderResigner {

    func gestureRecognizerManagerDidTapOnView(_ tapGestureRecognizerManager: TapGestureRecognizerManager) {
        if let viewThatCanContainTextInputs = viewThatCanContainTextInputs {
            let activeTextInputView = findActiveTextInput(in: viewThatCanContainTextInputs)
            activeTextInputView?.resignFirstResponder()
            tapGestureRecognizerManager.removeGestureRecognizer()
            self.tapGestureRecognizerManager = nil
        }
    }
    
    private func findActiveTextInput(in view: UIView) -> UIView? {
        if let textField = view as? UITextField, textField.isFirstResponder {
            return textField
        } else if let textView = view as? UITextView, textView.isFirstResponder {
            return textView
        }

        for aView in view.subviews {
            if let firstResponderView = findActiveTextInput(in: aView) {
                return firstResponderView
            }
        }

        return nil
    }
    
}
