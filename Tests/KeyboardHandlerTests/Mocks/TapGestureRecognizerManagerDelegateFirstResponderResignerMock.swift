//
//  TapGestureRecognizerManagerDelegateFirstResponderResignerMock.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

class TapGestureRecognizerManagerDelegateFirstResponderResignerMock: TapGestureRecognizerManagerDelegate, FirstResponderResigner {
    
    weak var viewToDismissKeyboardOnTap: UIView?
    weak var viewThatCanContainTextInputs: UIView?
    var tapGestureRecognizerManager: TapGestureRecognizerManager?
    
}
