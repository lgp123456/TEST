
//
//  AppDelegate.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //创建窗口
        window = UIWindow(frame: UIScreen .mainScreen().bounds)
        //设置窗口的跟控制器
        let tabBarVc = XTTabBarController()
        window?.rootViewController = tabBarVc
        window?.backgroundColor = UIColor.orangeColor()
        //显示窗口
        window?.makeKeyAndVisible()
        
        // 1.设置友盟APPKEY
//        UMSocialData.setAppKey("57c809d4e0f55aeb13003b53")
//        
//        // 2.设置新浪的APPKEY相关的内容
//        UMSocialSinaSSOHandler.openNewSinaSSOWithAppKey("1823864134", secret: "ce7570bf950a2196c31b8170842304f4", redirectURL: "http://www.baidu.com")
//        
//        // 3.设置微信的APPID等内容
//        UMSocialWechatHandler.setWXAppId("wxfd063527f89f900e", appSecret: "8c528d8644b14d4709ea9ed3d6e87ac9", url: "http://www.520it.com")
//        
//        // 4.设置QQ的APPID等内容
//        UMSocialQQHandler.setQQWithAppId("1105592131", appKey: "O1Kt9HUeh5zczivo", url: "http://www.baidu.com")
        
        return true
    }
    
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        let result = UMSocialSnsService.handleOpenURL(url)
        
        if result == false  {
            print("不是进行分享, 可能是支付宝集成")
        }
        return true
    }
    
    
}

///利用r g b 创建一个颜色
func XTColor(r r : CGFloat , g : CGFloat , b : CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}
