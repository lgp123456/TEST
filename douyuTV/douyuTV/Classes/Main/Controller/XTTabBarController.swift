//
//  XTTabBarController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

/////////////////////////////窗口的跟控制器///////////////////////////////////

import UIKit

class XTTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置tabBar条主题颜色
        tabBar.tintColor = XTColor(r: 245, g: 107, b: 52)
        tabBar.barStyle = .Default
        addChildVc()
    }
}

// MARK:- 添加子控制器
extension XTTabBarController {
    
    private func addChildVc() {
        //主页控制器
//        let storyboard = UIStoryboard(name: "XTHomeViewController", bundle: nil)
//        guard let homeVc = storyboard.instantiateInitialViewController() else {
//            return
//        }
        let homeVc = XTHomeViewController()
        setupChildVcWithNavVc(title: "首页", imageName: "btn_home_normal_24x24_", selImageName: "btn_home_selected_24x24_", vc: homeVc)
        
        //直播控制器
        let liveVc = XTLiveViewController()
        setupChildVcWithNavVc(title: "直播", imageName: "btn_column_normal_24x24_", selImageName: "btn_column_selected_24x24_", vc: liveVc)
        
        //关注控制器
        let followVc = XTFollowViewController()
        setupChildVcWithNavVc(title: "关注", imageName: "btn_live_normal_30x24_", selImageName: "btn_live_selected_30x24_", vc: followVc)
        
        //我的控制器
//        let meVc = XTMeViewController()
        let storyboard = UIStoryboard(name: "XTMeViewController", bundle: nil)
        guard let meVc = storyboard.instantiateInitialViewController() else {
            return
        }
        setupChildVcWithNavVc(title: "我的", imageName: "btn_user_normal_24x24_" , selImageName: "btn_user_selected_24x24_", vc: meVc)
    }
}

//设置子控制器TabBar条内容
extension XTTabBarController {
    ///设置带导航条的子控制器的tabBarItem
    private func setupChildVcWithNavVc(title title : String , imageName : String , selImageName : String , vc : UIViewController){
        //设置tabBarItem的文字和图片
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: selImageName)
        let navVc = XTNavigationController(rootViewController: vc)
        
        addChildViewController(navVc)
    }
    
    ///设置子控制器的tabBarItem
//    private func setupChildVc(title title : String , imageName : String , selImageName : String , vc : UIViewController){
//        //设置tabBarItem的文字和图片
//        vc.tabBarItem.title = title
//        vc.tabBarItem.image = UIImage(named: imageName)
//        vc.tabBarItem.selectedImage = UIImage(named: selImageName)
//        
//        addChildViewController(vc)
//    }
}



