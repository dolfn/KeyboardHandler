//
//  ViewControllerComplexExample.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import UIKit
import KeyboardHandler

class ViewControllerComplexExample: UIViewController, KeyboardHandlerDelegate {
    
    @IBOutlet weak var viewToHandleUserTaps: UIView?
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint?
    @IBOutlet private weak var bottomConstraintToAnimate: NSLayoutConstraint?
    
    private var keyboardHandlerForBottomConstraint: KeyboardHandlerForGivenConstraint?
    private var keyboardHandlerForCenteringConstraint: KeyboardHandlerForGivenConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let centerYConstraint = centerYConstraint, let bottomConstraintToAnimate = bottomConstraintToAnimate, let viewToHandleUserTaps = viewToHandleUserTaps else {
            fatalError()
        }
        
        keyboardHandlerForCenteringConstraint = try! KeyboardHandlerForGivenConstraint(constraintToAnimate: centerYConstraint, constraintOffset: 0, viewThatCanContainTextInputs: viewToHandleUserTaps, viewToDismissKeyboardOnTap: viewToHandleUserTaps, multiplier: 0.2)
        keyboardHandlerForCenteringConstraint?.delegate = self
        keyboardHandlerForCenteringConstraint?.startListeningForKeyboardEvents(in: NotificationCenter.default)
        
        keyboardHandlerForBottomConstraint = try! KeyboardHandlerForGivenConstraint(constraintToAnimate: bottomConstraintToAnimate, constraintOffset: 0, viewThatCanContainTextInputs: viewToHandleUserTaps, viewToDismissKeyboardOnTap: viewToHandleUserTaps)
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


