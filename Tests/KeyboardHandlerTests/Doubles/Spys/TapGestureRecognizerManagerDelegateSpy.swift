//
//  TapGestureRecognizerManagerDelegateSpy.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
@testable import KeyboardHandler

class TapGestureRecognizerManagerDelegateSpy: TapGestureRecognizerManagerDelegate {
    
    var tapGestureRecognizerManager: TapGestureRecognizerManager?
    
    func gestureRecognizerManagerDidTapOnView(_ tapGestureRecognizerManager: TapGestureRecognizerManager) {
        self.tapGestureRecognizerManager = tapGestureRecognizerManager
    }
    
}
