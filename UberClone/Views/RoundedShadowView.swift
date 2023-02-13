//
//  RoundedShadowView.swift
//  UberClone
//
//  Created by Hardi B. Salih on 13.02.2023.
//

import UIKit

class RoundedShadowView: UIView {
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = 5.0
        self.layer.cornerCurve = .continuous
        self.layer.shadowOpacity = 3
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        
    }

}
