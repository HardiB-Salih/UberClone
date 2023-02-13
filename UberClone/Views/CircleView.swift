//
//  CircleView.swift
//  UberClone
//
//  Created by Hardi B. Salih on 13.02.2023.
//

import UIKit

class CircleView: UIView {

    @IBInspectable var borderColor: UIColor? {
        didSet {
            setupView()
        }
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView () {
        self.layer.cornerRadius = self.layer.frame.width / 2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = borderColor?.cgColor
    }

}
