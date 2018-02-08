//
//  KeyboardHandler.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

public protocol KeyboardHandler {
    func handleKeyboard(withHeight keyboardHeight: CGFloat, keyboardStatus: KeyboardStatus)
}
