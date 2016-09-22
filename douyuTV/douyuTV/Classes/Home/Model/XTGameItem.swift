//
//  XTGameItem.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/29.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTGameItem: NSObject {
    var tag_name  = ""
    var icon_url = ""
    var url = ""
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}
