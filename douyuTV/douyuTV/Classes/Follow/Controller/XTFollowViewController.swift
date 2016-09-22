//
//  XTFollowViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTFollowViewController: XTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVC()
        title = "关注"
    }
    
    
}

extension XTFollowViewController {
    
    func addChildVC () {
        //添加直播中控制器
        let liveingVc = XTliveingViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        liveingVc.title = "直播中"
        addChildViewController(liveingVc)
        
        //添加未开播的控制器
        let notOnAir = XTNotOnAirViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        notOnAir.title = "未开播"
        addChildViewController(notOnAir)
    }
    
}