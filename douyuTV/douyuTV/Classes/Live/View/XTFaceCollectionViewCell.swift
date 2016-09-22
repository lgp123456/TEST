//
//  XTFaceCollectionViewCell.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/29.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTFaceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineLabel: UILabel!
    @IBOutlet weak var roomNamelabel: UILabel!
    @IBOutlet weak var citylabel: UILabel!
    
    // MARK:- 定义属性
    var funItem : XTFunItem? {
        didSet {
            // 1.校验模型是否有值
            guard let funItem = funItem else {
                return
            }
            
            // 2.给imageView设置数据
            let url = NSURL(string: funItem.vertical_src)
            iconImageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "dyla_直播结束背景图"))
            roomNamelabel.text = funItem.nickname
            
            var str = "\(funItem.online)在线"
            var count = (str as NSString).floatValue
            if count >= 10000 {
                count = count / 10000
                str = String(format: "%.2f万在线", count)
            }
            
            onlineLabel.text = str
            
            citylabel.text = funItem.anchor_city
        }
    }
    
}
