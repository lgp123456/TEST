//
//  XTFishSHowViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/28.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTFishSHowViewController: XTBaseLiveViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        url = "http://capi.douyucdn.cn/api/v1/getColumnRoom/10?aid=ios&client_sys=ios&limit=20&offset=0&time=1469015520&auth=19d9ee69d294976b98b90b67a2ca9f94"
        url = "http://capi.douyucdn.cn/api/v1/getColumnRoom/10?limit=20&offset=0"
    }
}

