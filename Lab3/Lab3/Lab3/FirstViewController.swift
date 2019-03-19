//
//  FirstViewController.swift
//  Lab3
//
//  Created by ZUI on 07.01.2019.
//  Copyright © 2019 JDBG. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBAction func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
    
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x, y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

