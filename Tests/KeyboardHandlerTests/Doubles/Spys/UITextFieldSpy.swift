//
//  UITextFieldSpy.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

class UITextFieldSpy: UITextField {
    
    var resignFirstResponderCalled = false
    var didAskIfItIsFirstResponder = false
    
    override var isFirstResponder: Bool {
        didAskIfItIsFirstResponder = true
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        resignFirstResponderCalled = true
        return true
    }
}
