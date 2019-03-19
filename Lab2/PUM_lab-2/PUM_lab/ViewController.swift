//
//  ViewController.swift
//
//  Created by Lab PUM on 30.10.2015.
//  Copyright © 2015 PS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    SmileViewControllerDelegate
{
    
    

    @IBOutlet weak var face: FaceView!
    
    @IBOutlet weak var colorEditButton: UIButton!
    @IBOutlet weak var smileEditButton: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    let lastView = segue.source as! ColorViewController
    face.red = CGFloat(lastView.RedSlider.value)
    face.blue = CGFloat(lastView.BlueSlider.value)
    face.green = CGFloat(lastView.GreenSlider.value)
        
    face.setNeedsDisplay()
    }
    func SmileViewController(_ controller: SmileViewController, smile: CGFloat) {
        face.smileValue = smile
        face.setNeedsDisplay()
        dismiss(animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSmileViewController" {
        let destinationController = segue.destination as! SmileViewController
        destinationController.smileValue = face.smileValue
        destinationController.delegate = self
        }
        else if segue.identifier == "toColorViewController" {
             let destinationController = segue.destination as! ColorViewController
            destinationController.red = Float(face.red)
            destinationController.blue = Float(face.blue)
            destinationController.green = Float(face.green)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        face.setNeedsDisplay()
        // Do any additional setup after loading the view, typically from a nib.
    }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

