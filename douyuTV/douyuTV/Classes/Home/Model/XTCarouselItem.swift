//
//  XTCarouselItem.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/27.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTCarouselItem: NSObject {
    var title  = ""
    var pic_url = ""
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}
