//
//  RoundImageView.swift
//  UberClone
//
//  Created by Hardi B. Salih on 14.02.2023.
//

import UIKit

class RoundImageView: UIImageView {

    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

}
