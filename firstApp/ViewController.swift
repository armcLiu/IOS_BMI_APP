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
    
    @IBOutlet weak var healthValue: UILabel!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var bmiList = DataList()
//    var history = [BmiInfo]()
    
    var timeFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myBMI = self.defaults.floatForKey("myBMI")
        self.labelText.text = "Your BMI is " + String(myBMI)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "promptForMsg"),
        UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "promptHistory"),
        UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: "shareTapped")]
        
        estimateHealthValue(Float(myBMI))
    }
    
    func estimateHealthValue(BMI:Float){
        if(BMI < 18.5){
            self.healthValue.text = "You are too thin."
        }
        else if(BMI > 23.9){
            self.healthValue.text = "You are too fat."
        }
        else{
            self.healthValue.text = "You are very Healthy, keep it."
        }
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
            
            self.defaults.setFloat(bmi, forKey: "myBMI")
            
            let myBMI = self.defaults.floatForKey("myBMI")
            
            self.labelText.text = "Your BMI is " + String(myBMI)
            self.estimateHealthValue(Float(myBMI))
            
            let date = NSDate()
            let strNowTime = self.timeFormatter.stringFromDate(date) as String
            let strWeight = String(weight)
            let strHeight = String(height)
            let strBmi = String(bmi)
            
            self.bmiList.history.append(BmiInfo(date: strNowTime, weight: strWeight, height: strHeight, bmi: strBmi))

        }
        
        
        
        ac.addAction(submitAction)
        presentViewController(ac, animated: true, completion: nil)
        
        labelText.text = "You clicked plus!"
        healthValue.text = ""
    }
    
    func promptHistory(){
        
    }
    
    func shareTapped(){
        let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        vc.setInitialText(labelText.text)
        vc.addURL(NSURL(string: "http://apple.com"))
        presentViewController(vc, animated: true, completion: nil)
    }

    //保存数据
    @IBAction func saveData(sender:AnyObject) {
        bmiList.saveData()
    }
    
    //读取数据
    @IBAction func loadData(sender:AnyObject) {
        bmiList.loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}





