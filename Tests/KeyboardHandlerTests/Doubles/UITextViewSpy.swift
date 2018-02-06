//
//  UITextViewSpy.swift
//  KeyboardHandler-iOS
//
//  Created by Andrei Nastasiu on 06/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

class UITextViewSpy: UITextView {
    
    var shouldExpectTheFunctionCall = false
    var didCallResignFirstResponder = false
    var didAskIfItIsFirstResponder = false
    
    override var isFirstResponder: Bool {
        didAskIfItIsFirstResponder = true
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        // First I wanted to do the same behavior as UITextFieldSpy
        // This function is called by the SDK without my express call
        // That's why I am using this flags
        if shouldExpectTheFunctionCall {
            didCallResignFirstResponder = true
        }
        return true
    }
    
}
