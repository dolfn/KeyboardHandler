//
//  TapGestureRecognizerManagerDelegateSpy.swift
//  KeyboardHandler-iOS
//
//  Created by Andrei Nastasiu on 06/02/2018.
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
