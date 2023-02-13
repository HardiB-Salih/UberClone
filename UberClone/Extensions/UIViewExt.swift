//
//  UIViewExt.swift
//  UberClone
//
//  Created by Hardi B. Salih on 13.02.2023.
//



import UIKit

extension UIView {
    func fadeTo(alphaValue: CGFloat, withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = alphaValue
        }
    }

}
