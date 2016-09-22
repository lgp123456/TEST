//
//  XTMeViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTMeViewController: UIViewController {

    private let tableID = "tableCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heaerView: UIView!
    
    var loginView : XTLoginView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加顶部的view
        addHeaderView()
        //取消系统设置的内边距
        automaticallyAdjustsScrollViewInsets = false
        //注册cell
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: tableID)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(XTMeViewController.loginBtnClick), name: "loginClick", object: nil)
        
        tableView.bounces = false
        
        //接收快速登录的通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(XTMeViewController.qqFastLogin), name: "qqLogin", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(XTMeViewController.sinaFastLogin), name: "sinaLogin", object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //改变状态栏的颜色
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        //隐藏导航条
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //改变状态栏的颜色
        UIApplication.sharedApplication().statusBarStyle = .Default
        //显示导航条
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - 第三方登录按钮
extension XTMeViewController {
    @objc private func qqFastLogin(){
         loginClick(UMShareToQQ)
    }
    
    @objc private func sinaFastLogin(){
        self.loginView?.removeFromSuperview()
       loginClick(UMShareToSina)
    }
    
    
    private func loginClick(platformName : String) {
        // 1.获取平台
        let snsPlatform = UMSocialSnsPlatformManager.getSocialPlatformWithName(platformName)
        
        // 2.进行三方登录
        snsPlatform.loginClickHandler(self, UMSocialControllerService.defaultControllerService(), true, { (response : UMSocialResponseEntity?) -> Void in
            // 1.对response进行校验
            guard let response = response else {
                return
            }
            
            // 2.判断响应码是否是正确
            guard response.responseCode == UMSResponseCodeSuccess else {
                return
            }
            
            // 3.获取用户登录的信息(uid/accessToken(昵称/头像))
            guard let snsAccount = UMSocialAccountManager.socialAccountDictionary()[snsPlatform.platformName] as? UMSocialAccountEntity else {
                return
            }
            
            print("uid:\(snsAccount.usid) 昵称:\(snsAccount.userName) 头像地址:\(snsAccount.iconURL) accessToken:\(snsAccount.accessToken)")
            
        })
    }
    
    
}


// MARK:- 登陆按钮点击
extension XTMeViewController {
    func loginBtnClick(){
        //添加loginView
        let loginView = XTLoginView.loadLoginInView()
        self.loginView = loginView
        
        loginView.center = CGPoint(x: XTScreenW * 0.5 , y: XTScreenH * 0.5)
//        loginView.bounds.size = CGSize(width: 0, height: 0)
        loginView.transform = CGAffineTransformMakeScale(0, 0);
        UIApplication.sharedApplication().keyWindow?.addSubview(loginView)
        //执行动画
        UIView.animateWithDuration(0.25) {
            loginView.transform = CGAffineTransformIdentity
            loginView.bounds.size = CGSize(width: XTScreenW, height: XTScreenH)
//            loginView.center = CGPoint(x: XTScreenW * 0.5 , y: XTScreenH * 0.5)
        }
    }
}

// MARK:- 添加顶部View
extension XTMeViewController {
    func addHeaderView(){
        //添加headerView
        let headerXibView = XTHeaderView.loadHeaderView()
        headerXibView.frame = self.heaerView.bounds
        heaerView.addSubview(headerXibView)
    }
}

// MARK:- UITableView数据源方法
extension XTMeViewController : UITableViewDataSource {
    //tableview有多少组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    //每一组有多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    //每个cell的内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCellWithIdentifier(tableID)
     
//        cell?.selectionStyle = .None
        cell?.accessoryType = .DisclosureIndicator
        cell?.textLabel?.text = "开播提醒"
        cell?.imageView?.image = UIImage(named: "image_my_settings_18x18_")
        return cell!
    }
    //设置组的头部间距
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        if (section == 0) {
            return 15;
        }
        return 5
    }
     //设置组的尾部间距
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}