//
//  TapGestureRecognizerManagerDelegateFirstResponderResigner.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

extension TapGestureRecognizerManagerDelegate where Self: FirstResponderResigner {

    func gestureRecognizerManagerDidTapOnView(_ tapGestureRecognizerManager: TapGestureRecognizerManager) {
        if let viewThatCanContainTextInputs = viewThatCanContainTextInputs {
            let activeTextInputView = findActiveTextInput(in: [viewThatCanContainTextInputs])
            activeTextInputView?.resignFirstResponder()
            tapGestureRecognizerManager.removeGestureRecognizer()
            self.tapGestureRecognizerManager = nil
        }
    }
    
    private func findActiveTextInput(in views: [UIView]) -> UIView? {
        for aView in views {
            if let textField = aView as? UITextField, textField.isFirstResponder {
                return textField
            } else if let textView = aView as? UITextView, textView.isFirstResponder {
                return textView
            } else {
                return findActiveTextInput(in: aView.subviews)
            }
        }
        return nil
    }
    
}
