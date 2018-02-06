//
//  ObserverReceiver.swift
//  KeyboardHandler-iOS
//
//  Created by Andrei Nastasiu on 06/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

public protocol ObserverReceiver {
    func addObserver(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue?, using block: @escaping (Notification) -> Swift.Void) -> NSObjectProtocol
}

extension NotificationCenter: ObserverReceiver { }
