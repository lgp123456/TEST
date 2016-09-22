//
//  XTAllViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/28.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTAllViewController: XTBaseLiveViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        url = "http://capi.douyucdn.cn/api/v1/live?aid=ios&client_sys=ios&limit=20&offset=0&time=1468894680&auth=848c60f9ab96f0ee866a8ab588f2e2b6"
         url = "http://capi.douyucdn.cn/api/v1/live?&limit=20&offset=0"
    }
}

