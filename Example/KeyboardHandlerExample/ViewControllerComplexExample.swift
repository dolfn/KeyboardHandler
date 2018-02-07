//
//  ViewControllerComplexExample.swift
//  KeyboardHandlerExample
//
//  Created by Andrei Nastasiu on 07/02/2018.
//  Copyright © 2018 Dolfn. All rights reserved.
//

import UIKit
import KeyboardHandler

class ViewControllerComplexExample: UIViewController, KeyboardHandlerDelegate {
    
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint?
    @IBOutlet private weak var bottomConstraintToAnimate: NSLayoutConstraint?
    
    private var keyboardHandlerForBottomConstraint: KeyboardHandlerForBottomConstraint?
    private var keyboardHandlerForCenteringConstraint: KeyboardHandlerForCenteringConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let centerYConstraint = centerYConstraint, let bottomConstraintToAnimate = bottomConstraintToAnimate else {
            fatalError()
        }
        
        keyboardHandlerForCenteringConstraint = KeyboardHandlerForCenteringConstraint(constraint: centerYConstraint)
        keyboardHandlerForCenteringConstraint?.delegate = self
        keyboardHandlerForCenteringConstraint?.startListeningForKeyboardEvents(in: NotificationCenter.default)
        
        keyboardHandlerForBottomConstraint = KeyboardHandlerForBottomConstraint(constraintToAnimate: bottomConstraintToAnimate, constraintOffset: 0, viewThatCanContainTextInputs: self.view, viewToDismissKeyboardOnTap: self.view)
        keyboardHandlerForBottomConstraint?.delegate = self
        keyboardHandlerForBottomConstraint?.startListeningForKeyboardEvents(in: NotificationCenter.default)
    }
    
    // MARK: - KeyboardHandlerDelegate
    func willShowKeyboard(height: CGFloat) {
        print("Will show keyboard with height: " + String(describing: height))
    }
    
    func didShowKeyboard(height: CGFloat) {
        print("Did show keyboard with height: " + String(describing: height))
    }
    
    func willHideKeyboard(height: CGFloat) {
        print("Will hide keyboard with height: " + String(describing: height))
    }
    
    func didHideKeyboard(height: CGFloat) {
        print("Did hide keyboard with height: " + String(describing: height))
    }
    
}


