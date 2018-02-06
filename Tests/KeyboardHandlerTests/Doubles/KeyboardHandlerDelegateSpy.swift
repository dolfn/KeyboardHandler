//
//  KeyboardHandlerDelegateSpy.swift
//  KeyboardHandler-iOS
//
//  Created by Andrei Nastasiu on 05/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit
@testable import KeyboardHandler

class KeyboardHandlerDelegateSpy: KeyboardHandlerDelegate {
    
    var willShowKeyboardCalled = false
    var didShowKeyboardCalled = false
    var willHideKeyboardCalled = false
    var didHideKeyboardCalled = false
    var receivedHeight: CGFloat?
    
    func willShowKeyboard(height: CGFloat) {
        willShowKeyboardCalled = true
        receivedHeight = height
    }
    
    func didShowKeyboard(height: CGFloat) {
        didShowKeyboardCalled = true
        receivedHeight = height
    }
    
    func willHideKeyboard(height: CGFloat) {
        willHideKeyboardCalled = true
        receivedHeight = height
    }
    
    func didHideKeyboard(height: CGFloat) {
        didHideKeyboardCalled = true
        receivedHeight = height
    }
    
    
}
