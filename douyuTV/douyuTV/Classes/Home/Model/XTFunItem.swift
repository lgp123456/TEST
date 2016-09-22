//
//  XTFunItem.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/27.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTFunItem: NSObject {
    //普通cell的属性
    var room_src = ""
    var nickname = ""
    var tag_id : NSNumber = 0
    
    //公共属性
    var online : NSNumber = 0
    var room_name = ""
    
    //颜值cell的属性
    var vertical_src = ""
    var anchor_city = ""
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}
