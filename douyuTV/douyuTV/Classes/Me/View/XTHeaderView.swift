//
//  XTHeaderView.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/26.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTHeaderView: UIView {

    @IBOutlet weak var headImageView: UIButton!

    override func awakeFromNib() {
        headImageView.layer.cornerRadius = headImageView.frame.width*0.5
        headImageView.layer.masksToBounds = true
        headImageView.layer.borderWidth = 3
        headImageView.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    class func loadHeaderView() -> XTHeaderView {
        return NSBundle.mainBundle().loadNibNamed("XTHeaderView", owner: nil, options: nil).first as! XTHeaderView
    }

}

// MARK:- headerView 点击事件处理
extension XTHeaderView {

    @IBAction func loginClick(sender: AnyObject) {
        
        NSNotificationCenter.defaultCenter().postNotificationName("loginClick", object: nil)
    }
    
}

// MARK:- loginInView点击事件处理
extension XTHeaderView {
    
}