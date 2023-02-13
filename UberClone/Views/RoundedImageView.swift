//
//  RoundedImageView.swift
//  UberClone
//
//  Created by Hardi B. Salih on 13.02.2023.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        setUpView()
    }
   
    func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
