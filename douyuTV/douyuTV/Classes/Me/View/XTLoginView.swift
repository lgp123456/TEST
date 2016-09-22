//
//  XTLoginView.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/26.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTLoginView: UIView {

    class func loadLoginInView() -> XTLoginView {
        
        return NSBundle.mainBundle().loadNibNamed("XTLoginView", owner: nil, options: nil).last as! XTLoginView
    }
    
    
    @IBAction func agreementClick(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.douyu.com/protocal/member")!)
    }
    
    @IBAction func cancelClick(sender: AnyObject) {
      
//        self.transform = CGAffineTransformIdentity
//        self.frame.size = CGSize(width: XTScreenW, height: XTScreenH)
//        UIView.animateWithDuration(0.25) {
//            self.transform = CGAffineTransformMakeScale(0, 0)
//        }
        self.removeFromSuperview()
    }
    
}
// MARK: - 登录
extension XTLoginView {

    @IBAction func qqLoginClick(sender: AnyObject) {
        
        NSNotificationCenter.defaultCenter().postNotificationName("qqLogin", object: nil, userInfo: nil)
       
    }

    @IBAction func sinaLoginClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("sinaLogin", object: nil, userInfo: nil)
    }
    
    
}
