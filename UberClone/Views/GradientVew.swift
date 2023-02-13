//
//  GradientVew.swift
//  UberClone
//
//  Created by Hardi B. Salih on 13.02.2023.
//

import UIKit

class GradientVew: UIView {
    
    let gradient = CAGradientLayer()
    
    override func awakeFromNib() {
        setUpGradientVew()
    }
    
    func setUpGradientVew() {
        gradient.frame = self.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.init(white: 1.0, alpha: 0.0).cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint  = CGPoint(x: 0, y: 1)
        gradient.locations = [0.8, 1.0]
        self.layer.addSublayer(gradient)
    }

}
