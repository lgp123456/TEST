//
//  XTLiveViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTLiveViewController: XTALLBaseLiveViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVc()
        // collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 49, right: 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //隐藏导航条
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //显示导航条
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK:- 添加子控制器
extension XTLiveViewController {
    func addChildVc(){
        //常用控制器
        let comVc =  XTCommonViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        comVc.title = "常用"
        addChildViewController(comVc)
        
        //全部控制器
        let allVc =  XTAllViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        
        allVc.title = "全部"
        addChildViewController(allVc)
        
        //游戏控制器
        let gameVc =  XTGameLiveViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        
        gameVc.title = "热门游戏"
        addChildViewController(gameVc)
        
        //手机游戏控制器
        let phoneGame =  XTPhoneGameViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        
        phoneGame.title = "手游休闲"
        addChildViewController(phoneGame)
        
        //鱼乐星天地控制器
        let fishVc =  XTFishStarViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        
        fishVc.title = "鱼乐星天地"
        addChildViewController(fishVc)
        
        //鱼秀控制器
        let showVc =  XTFishSHowViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        
        showVc.title = "鱼秀"
        addChildViewController(showVc)
        
        //颜值控制器
        let faceVc =  XTFaceScoreViewController(collectionViewLayout: XTFaceViewFlowLayout())
        
        faceVc.title = "颜值"
        addChildViewController(faceVc)
        
        //科技控制器
        let techVc =  XTTechnologyViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        
        techVc.title = "科技"
        addChildViewController(techVc)
        
        //文娱课堂控制器
        let enterVc =  XTEnterClassViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        
        enterVc.title = "文娱课堂"
        addChildViewController(enterVc)
        
        //体育频道控制器
        let sportVc =  XTSportsViewController(collectionViewLayout: XTLiveingViewFlowLayout())
        
        sportVc.title = "体育频道"
        addChildViewController(sportVc)
        
        //自己添加的测试控制器
        let addLiveVc = XTAddLiveViewController()
        
        addLiveVc.title = "直播"
        addChildViewController(addLiveVc)
        
    }
}