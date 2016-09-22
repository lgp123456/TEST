//
//  XTAddLiveItem.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/9/2.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTAddLiveItem: NSObject {
    //位置
    var gps  = ""
    //直播流地址
    var flv = ""
    //主播名称
    var myname = ""
    //等级
    var starlevel : NSNumber = 0
    //小图地址
    var smallpic = ""
    //大图地址
    var bigpic = ""
    //粉丝数
    var allnum : NSNumber = 0
    
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}
