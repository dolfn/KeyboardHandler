//
//  KeyboardShowingOrHidingListener.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation

public protocol KeyboardShowingOrHidingListener: class {
    var tokens: [AnyObject]? { get set }
    func startListeningForKeyboardEvents(in: ObserverReceiver)
    func stopListeningForKeyboardEvents(in: ObserverReceiver)
}
