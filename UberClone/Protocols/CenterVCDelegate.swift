//
//  CenterVCDelegate.swift
//  UberClone
//
//  Created by Hardi B. Salih on 13.02.2023.
//

import Foundation

protocol CenterVCDelegate {
    func toggleLeftPanel()
    func addLeftPanelViewController()
    func animateLeftPanel(shouldExpand: Bool)
}
