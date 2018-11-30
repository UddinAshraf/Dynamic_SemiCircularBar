//
//  ViewController.swift
//  Financial App
//
//  Created by BS126 on 11/7/18.
//  Copyright © 2018 BS23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.centerView.layer.cornerRadius = self.centerView.frame.size.width / 2
        //self.centerView.layer.cornerRadius = self.centerView.frame.size.height / 2
        //self.centerView.layer.masksToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width: CGFloat = self.view.bounds.width
        let height: CGFloat = self.view.bounds.height / 2 + 100
        
        let upperTransparentView = UpperTransparentView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        self.view.addSubview(upperTransparentView)
        
    }


}

