//
//  XTFunViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/25.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTFunViewController: XTBaseLiveViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //取消系统设置的内边距
        automaticallyAdjustsScrollViewInsets = false
        collectionView?.contentInset = UIEdgeInsets(top: 70 + 35, left: 0, bottom: 49, right: 0)
        //设置背景色
        collectionView?.backgroundColor = UIColor.clearColor()
        url = "http://capi.douyucdn.cn/api/v1/getColumnRoom/3?limit=20&offset=0"
        
    }

}
