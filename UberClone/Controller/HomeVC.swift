//
//  HomeVC.swift
//  UberClone
//
//  Created by Hardi B. Salih on 13.02.2023.
//

import UIKit
import MapKit

class HomeVC: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var actionBtn: RoundedShadowButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var actionBtnBottomConstrain: NSLayoutConstraint!
    var delegate: CenterVCDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        actionBtnBottomConstrain.constant = UIScreen.main.bounds.width - 40
    }

    @IBAction func actionBtnWasPressed(_ sender: Any) {
        actionBtnBottomConstrain.constant = 60
        actionBtn.animateButton(shouldLoad: true, withMessage: nil)
        
    }
    
    @IBAction func menuBtnWasPressed(_ sender: Any) {
        delegate?.toggleLeftPanel()
        print("Hello")
        
    }
}

