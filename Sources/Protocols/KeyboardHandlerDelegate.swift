//
//  KeyboardHandlerDelegate.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

public protocol KeyboardHandlerDelegate: class {
    func willShowKeyboard(height: CGFloat)
    func didShowKeyboard(height: CGFloat)
    func willHideKeyboard(height: CGFloat)
    func didHideKeyboard(height: CGFloat)
}
