//
//  XTFishStarViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/28.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTFishStarViewController: XTBaseLiveViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        url = "http://capi.douyucdn.cn/api/v1/getColumnRoom/2?aid=ios&client_sys=ios&limit=20&offset=0&time=1469009220&auth=cfde7142646e9d6305ae3a37e0e3c176"
        url = "http://capi.douyucdn.cn/api/v1/getColumnRoom/2?limit=20&offset=0"
    }
}