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
        let ac = UIAlertController(title: "Enter Message", message: nil, preferredStyle: .Alert)
        ac.addTextFieldWithConfigurationHandler(nil)
        
        let submitAction = UIAlertAction(title: "Submit", style: .Default){
            [unowned self, ac] (action: UIAlertAction) in
            let answer = ac.textFields![0]
            self.labelText.text = answer.text
            
        }
        
        ac.addAction(submitAction)
        presentViewController(ac, animated: true, completion: nil)
        
        labelText.text = "You clicked plus!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

