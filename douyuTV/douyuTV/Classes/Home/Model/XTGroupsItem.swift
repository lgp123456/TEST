//
//  XTGroupsItem.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/27.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTGroupsItem: NSObject {
    //定义属性
    var tag_name = ""
    var icon_url = ""
    
    var funItems : [XTFunItem]  = [XTFunItem]()
    
    //监听属性改变
    var room_list : [[String : NSObject]]? {
        didSet {
            for funItem in room_list! {
                funItems.append(XTFunItem(dict: funItem))
                
            }
        }
    }
    //字典转模型
    init(dict : [String : NSObject]){
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
   
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
    
//    override func setValue(value: AnyObject?, forKey key: String) {
//        
//    }
}
