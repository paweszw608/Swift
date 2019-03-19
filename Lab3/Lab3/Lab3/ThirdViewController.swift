//
//  ThirdViewController.swift
//  Lab3
//
//  Created by ZUI on 07.01.2019.
//  Copyright © 2019 JDBG. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    // licznik
    @IBOutlet weak var secondsValue: UILabel!
    var counter = 0
    
    // timer
    var timer = Timer()
    var activeTimer = false
    
    
    // gesty
    var singleTap : UITapGestureRecognizer!
    var doubleTap : UITapGestureRecognizer!
    var swipeRight : UISwipeGestureRecognizer!
    
    @objc func count()
    {
        counter += 1
        secondsValue.text = String(counter)
    }
    
    @objc func handleSwipes()
    {
        counter = 0
        secondsValue.text = String(counter)
    }
    
    @objc func handleSingleTap()
    {
        if(!activeTimer){
            timer = Timer.scheduledTimer(timeInterval:1,target:self, selector: #selector(count),userInfo:nil,repeats:true)
            activeTimer = true
        }
    }
    
    @objc func handleDTap(){
        timer.invalidate()
        activeTimer = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        swipeRight = UISwipeGestureRecognizer(target:
            self, action: #selector(handleSwipes))
        
        singleTap = UITapGestureRecognizer(target:
            self, action: #selector(handleSingleTap))
        
        doubleTap = UITapGestureRecognizer(target:
            self, action: #selector(handleDTap))
        
        doubleTap.numberOfTouchesRequired = 2
        
        singleTap.numberOfTouchesRequired = 1
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(singleTap)
        view.addGestureRecognizer(doubleTap)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
