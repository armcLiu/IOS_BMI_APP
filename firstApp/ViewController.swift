//
//  ViewController.swift
//  firstApp
//
//  Created by 刘志兴 on 16/2/26.
//  Copyright © 2016年 刘志兴. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "promptForMsg"),
        UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: "shareTapped")]

    }
    
    func promptForMsg(){
        let ac = UIAlertController(title: "Enter Message", message: nil, preferredStyle: .Alert)
        ac.addTextFieldWithConfigurationHandler{(textField: UITextField) in
            textField.keyboardType = UIKeyboardType.DecimalPad
            textField.placeholder = "Weight (kg)"
        }
        ac.addTextFieldWithConfigurationHandler{(textField: UITextField) in
            textField.keyboardType = UIKeyboardType.DecimalPad
            textField.placeholder = "Height (m)"
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .Default){
            [unowned self, ac] (action: UIAlertAction) in
            let weight = Float(ac.textFields![0].text!)
            let height = Float(ac.textFields![1].text!)
            let bmi = weight! / (height! * height!)
            self.labelText.text = "Your BMI is " + String(bmi)
            
        }
        
        
        
        ac.addAction(submitAction)
        presentViewController(ac, animated: true, completion: nil)
        
        labelText.text = "You clicked plus!"
    }
    
    func shareTapped(){
        let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        vc.setInitialText(labelText.text)
        presentViewController(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

