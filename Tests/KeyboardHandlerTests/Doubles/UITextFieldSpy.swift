//
//  UITextFieldSpy.swift
//  KeyboardHandler-iOS
//
//  Created by Andrei Nastasiu on 06/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

class UITextFieldSpy: UITextField {
    
    var resignFirstResponderCalled = false
    
    override var isFirstResponder: Bool {
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        resignFirstResponderCalled = true
        return true
    }
}
