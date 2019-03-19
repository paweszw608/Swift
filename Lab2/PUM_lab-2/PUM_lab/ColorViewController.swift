//
//  ColorViewController.swift
//  PUM_lab
//
//  Created by ZUI on 28.11.2018.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var RedSlider: UISlider!
    @IBOutlet weak var GreenSlider: UISlider!
    @IBOutlet weak var BlueSlider: UISlider!
    
    var red = Float(0)
    var blue = Float(0)
    var green = Float(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RedSlider.value = red
        GreenSlider.value = green
        BlueSlider.value = blue
        
        // Do any additional setup after loading the view.
    }
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
