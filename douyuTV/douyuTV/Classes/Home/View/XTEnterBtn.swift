//
//  XTEnterBtn.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/9/7.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTEnterBtn: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        titleLabel!.textAlignment = .Center
        titleLabel?.font = UIFont.systemFontOfSize(11)
        self.setTitleColor(UIColor.grayColor(), forState: .Normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        //设置图片的frame
        imageView?.frame.size.width = frame.width * 0.6;
        imageView!.frame.size.height = frame.width * 0.6;
        imageView?.center.x = frame.width * 0.5
        imageView?.frame.origin.y = 0
        
        imageView?.layer.cornerRadius = (imageView?.frame.width)!*0.5
        imageView?.layer.masksToBounds = true
        
        //设置文字的frame
        titleLabel?.sizeToFit()
        titleLabel?.center.x = frame.width * 0.5
        titleLabel?.frame.origin.y = CGRectGetMaxY((imageView?.frame)!) + 5
    }
}

