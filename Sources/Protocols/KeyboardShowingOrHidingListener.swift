//
//  KeyboardShowingOrHidingListener.swift
//  KeyboardHandler-iOS
//
//  Created by Andrei Nastasiu on 05/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation

public protocol KeyboardShowingOrHidingListener: class {
    var tokens: [AnyObject]? { get set }
    func startListeningForShowingOrHidingTheKeyboard()
    func stopListeningForShowingOrHidingKeyboard()
}
