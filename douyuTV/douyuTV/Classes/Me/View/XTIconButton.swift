//
//  XTIconButton.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/26.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTIconButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        //设置图片的frame
        imageView?.center.x = frame.width * 0.5
        imageView?.frame.origin.y = frame.height * 0.5 - 20
        
        
        //设置文字的frame
        titleLabel?.sizeToFit()
        titleLabel?.center.x = frame.width * 0.5
        titleLabel?.frame.origin.y = CGRectGetMaxY((imageView?.frame)!) + 7
    }
}
