//
//  XTPhoneGameViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/30.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTPhoneGameViewController: XTBaseLiveViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        url = "http://capi.douyucdn.cn/api/v1/getColumnRoom/9?aid=ios&client_sys=ios&limit=20&offset=0&time=1469008980&auth=3392837008aa8938f7dce0d8c72c321d"
        url = "http://capi.douyucdn.cn/api/v1/getColumnRoom/9?limit=20&offset=0"
    }
}
