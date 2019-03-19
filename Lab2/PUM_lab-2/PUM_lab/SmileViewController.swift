//
//  SmileViewController.swift
//  PUM_lab
//
//  Created by ZUI on 28.11.2018.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

protocol SmileViewControllerDelegate {
    func SmileViewController(_ controller:SmileViewController, smile: CGFloat)
    
}
class SmileViewController: UIViewController {

    @IBOutlet weak var SmileSlider: UISlider!
    var smileValue = CGFloat(0)
    
    var delegate: SmileViewControllerDelegate?
    
    @IBAction func goBack(_ sender: Any) {
        delegate?.SmileViewController(self, smile: CGFloat(SmileSlider.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SmileSlider.value = Float(smileValue)

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
