//
//  FirstResponderResigner.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

protocol FirstResponderResigner: class {
    var viewThatCanContainTextInputs: UIView? { get }
    var tapGestureRecognizerManager: TapGestureRecognizerManager? { get set }
}
