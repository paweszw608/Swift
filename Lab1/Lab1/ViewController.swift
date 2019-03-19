//
//  ViewController.swift
//  Lab1Dzbany
//
//  Created by ZUI on 17.04.2018.
//  Copyright © 2018 SCLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func resignKeyboard(_ sender: UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var S1: UITextField!
    
    @IBOutlet weak var S2: UITextField!
    
    @IBAction func run(_ sender: UIButton) {

        var msg: String?
        if(S1.text == S2.text)
        {
            msg = "Strings are the same"
        }
        else
        {
            msg = "Strings are not the same"
        }
        let alert = UIAlertController(title: "Result", message:msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Spoko", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated:true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

