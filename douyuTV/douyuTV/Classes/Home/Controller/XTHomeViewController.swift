//
//  XTHomeViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTHomeViewController: XTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.lightGrayColor()
        setupNavigationBar()
        addChildVc()
    }
}
// MARK:- 添加子控制器
extension XTHomeViewController {
    func addChildVc(){
        //推荐控制器
        let recVc =  XTRecommendViewController(collectionViewLayout: XTHeaderLiveViewFlowLayout())
       
        recVc.title = "推荐"
        addChildViewController(recVc)
        
        //游戏控制器
        let gameVc =  XTGameViewController(collectionViewLayout: XTGameViewFlowLayout())

        gameVc.title = "游戏"
        addChildViewController(gameVc)
        
        //娱乐控制器
        let enterVc =  XTEntertainmentViewController(collectionViewLayout: XTHeaderLiveViewFlowLayout())
 
        enterVc.title = "娱乐"
        addChildViewController(enterVc)
        
        //趣玩控制器
        let funVc =  XTFunViewController(collectionViewLayout: XTLiveingViewFlowLayout())
   
        funVc.title = "趣玩"
        addChildViewController(funVc)
        
    }
}
// MARK: - 设置导航栏
extension XTHomeViewController {
    func setupNavigationBar(){
        //设置导航条左侧按钮
        let douYuBtn = UIButton()
        douYuBtn.setImage(UIImage(named: "logo_66x26_"), forState: .Normal)
        douYuBtn.sizeToFit()
        douYuBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
        let view = UIView(frame: douYuBtn.bounds)
        view.addSubview(douYuBtn)
        
        let douYuItem = UIBarButtonItem(customView: view)
        navigationItem.leftBarButtonItem = douYuItem
        
        //设置导航条右边按钮
        let scanBtn = UIButton()
        scanBtn.setImage(UIImage(named: "Image_scan_22x22_"), forState: .Normal)
        scanBtn.setImage(UIImage(named: "Image_scan_click_22x22_"), forState: .Highlighted)
        scanBtn.sizeToFit()
        scanBtn.bounds.size.width = 35
//        scanBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        let scanItem = UIBarButtonItem(customView: scanBtn)
        
        let searchBtn = UIButton()
        searchBtn.setImage(UIImage(named: "btn_search_22x22_"), forState: .Normal)
        searchBtn.setImage(UIImage(named: "btn_search_clicked_22x22_"), forState: .Highlighted)
        searchBtn.sizeToFit()
        searchBtn.bounds.size.width = 35
//        searchBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
        let searchItem = UIBarButtonItem(customView: searchBtn)
        
        let historyBtn = UIButton()
        historyBtn.setImage(UIImage(named: "image_my_history_26x26_"), forState: .Normal)
        historyBtn.setImage(UIImage(named: "Image_my_history_click_22x22_"), forState: .Highlighted)
        historyBtn.sizeToFit()
        historyBtn.bounds.size.width = 35
//        historyBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let historyItem = UIBarButtonItem(customView: historyBtn)
        
        navigationItem.rightBarButtonItems = [historyItem , searchItem , scanItem]
    }
}