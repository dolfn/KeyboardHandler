//
//  FirstResponderResigner.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

protocol FirstResponderResigner: class {
    
    weak var viewThatCanContainTextInputs: UIView? { get }
    weak var viewToDismissKeyboardOnTap: UIView? { get }
    var tapGestureRecognizerManager: TapGestureRecognizerManager? { get set }
    
}
