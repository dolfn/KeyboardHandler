//
//  ViewControllerWithTextFieldAndCenterConstraint.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import UIKit
import KeyboardHandler

class ViewControllerWithTextFieldAndCenterConstraint: UIViewController, KeyboardHandlerDelegate {
    
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint?
    private var keyboardHandlerForGivenConstraint: KeyboardHandlerForGivenConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let centerYConstraint = centerYConstraint else {
            fatalError()
        }
        
        keyboardHandlerForGivenConstraint = try! KeyboardHandlerForGivenConstraint(constraintToAnimate: centerYConstraint, constraintOffset: 0, viewThatCanContainTextInputs: self.view, viewToDismissKeyboardOnTap: self.view, multiplier: 0.2)
        keyboardHandlerForGivenConstraint?.delegate = self
        keyboardHandlerForGivenConstraint?.startListeningForKeyboardEvents(in: NotificationCenter.default)
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
