//
//  PortraitViewController.swift
//  pw-rotation
//
//  Created by Eliezer Sant Ana on 14/10/20.
//

import UIKit

class PortraitViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (UIApplication.shared.delegate as! AppDelegate).blockRotation = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        (UIApplication.shared.delegate as! AppDelegate).blockRotation = false
    }
}
