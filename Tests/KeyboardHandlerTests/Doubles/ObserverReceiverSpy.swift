//
//  ObserverReceiverSpy.swift
//  KeyboardHandler-iOS
//
//  Created by Andrei Nastasiu on 06/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation

class ObserverReceiverSpy: ObserverReceiver {
    
    var names = [NSNotification.Name]()
    var objs = [Any]()
    var queues = [OperationQueue]()
    var blocks = [((Notification) -> Void)]()
    var pairredNotificationsWithBlocks = [NSNotification.Name: ((Notification) -> Void)]()
    
    func addObserver(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue?, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        
        if let name = name {
            names.append(name)
            pairredNotificationsWithBlocks[name] = block
        }
        
        if let obj = obj {
            objs.append(obj)
        }
        
        if let queue = queue {
            queues.append(queue)
        }
        
        blocks.append(block)
        
        
        return NSObject()
    }
}
