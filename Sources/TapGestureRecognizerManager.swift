//
//  TapGestureRecognizerManager.swift
//  Copyright © 2018 Dolfn. All rights reserved.
//

import Foundation
import UIKit

class TapGestureRecognizerManager {
    
    fileprivate weak var tapGestureRecognizer: UITapGestureRecognizer?
    weak var viewToSetGestureRecognizerFor: UIView?
    weak var delegate: TapGestureRecognizerManagerDelegate?
    
    init(viewToSetGestureRecognizerFor: UIView) {
        self.viewToSetGestureRecognizerFor = viewToSetGestureRecognizerFor
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TapGestureRecognizerManager.gestureRecognizerDidTap(_:)))
        viewToSetGestureRecognizerFor.addGestureRecognizer(tapGestureRecognizer)
        self.tapGestureRecognizer = tapGestureRecognizer
    }
    
    deinit {
        if let tapGestureRecognizer = tapGestureRecognizer {
            tapGestureRecognizer.removeTarget(self, action: #selector(TapGestureRecognizerManager.gestureRecognizerDidTap(_:)))
            viewToSetGestureRecognizerFor?.removeGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    func removeGestureRecognizer() {
        if let tapGestureRecognizer = tapGestureRecognizer {
            viewToSetGestureRecognizerFor?.removeGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @objc func gestureRecognizerDidTap(_ tapGestureRecognizer: UITapGestureRecognizer) {
//        delegate?.gestureRecognizerManagerDidTapOnView(self)
    }
}
