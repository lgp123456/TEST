//
//  XTLiveCollectionViewCell.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/27.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit
import SDWebImage

class XTLiveCollectionViewCell:UICollectionViewCell {
    // MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var starNameLabel: UILabel!
    @IBOutlet weak var fansCountLabel: UILabel!
    @IBOutlet weak var roomNameLabel: UILabel!
    
    // MARK:- 定义属性
    var funItem : XTFunItem? {
        didSet {
            // 1.校验模型是否有值
            guard let funItem = funItem else {
                return
            }
            
            // 2.给imageView设置数据
           let url = NSURL(string: funItem.room_src)
            iconImageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "dyla_直播结束背景图"))
            starNameLabel.text = funItem.nickname
            
            var str = "\(funItem.online)"
            var count = (str as NSString).floatValue
            if count >= 10000 {
                count = count / 10000
                str = String(format: "%.2f万", count)
            }
            
            fansCountLabel.text = str
            roomNameLabel.text = funItem.room_name
        }
    }
}
