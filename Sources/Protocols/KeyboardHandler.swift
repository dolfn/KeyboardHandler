//
//  KeyboardHandler.swift
//  KeyboardHandler-iOS
//
//  Created by Andrei Nastasiu on 05/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

public protocol KeyboardHandler {
    func handleKeyboard(withHeight keyboardHeight: CGFloat, keyboardStatus: KeyboardStatus)
}
