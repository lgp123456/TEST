//
//  XTSportsViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/31.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTSportsViewController: XTBaseLiveViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        url = "http://capi.douyucdn.cn/api/v1/getColumnRoom/8?aid=ios&client_sys=ios&limit=20&offset=0&time=1469009040&auth=411b9ed1d270efe90e260391e0a93d62"
          url = "http://capi.douyucdn.cn/api/v1/getColumnRoom/8?limit=20&offset=0"
        
    }
}

