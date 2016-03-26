//
//  BserInfo.swift
//  firstApp
//
//  Created by 刘志兴 on 16/3/26.
//  Copyright © 2016年 刘志兴. All rights reserved.
//

import Foundation
import UIKit

class UserInfo: NSObject {
    var date:String
    var bmi:String
    
    //构造方法
    init(date:String="",bmi:String=""){
        self.date = date
        self.bmi = bmi
        super.init()
    }
    
    //从nsobject解析回来
    init(coder aDecoder:NSCoder!){
        self.date=aDecoder.decodeObjectForKey("Date") as! String
        self.bmi=aDecoder.decodeObjectForKey("Bmi") as! String
    }
    
    //编码成object
    func encodeWithCoder(aCoder:NSCoder!){
        aCoder.encodeObject(date,forKey:"Date")
        aCoder.encodeObject(bmi,forKey:"Bmi")
    }
}
