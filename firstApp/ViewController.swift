//
//  ViewController.swift
//  firstApp
//
//  Created by 刘志兴 on 16/2/26.
//  Copyright © 2016年 刘志兴. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "promptForMsg")
        
    }
    
    func promptForMsg(){
        labelText.text = "You clicked plus"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

