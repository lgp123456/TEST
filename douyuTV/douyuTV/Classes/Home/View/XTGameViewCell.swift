//
//  XTGameViewCell.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/29.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit
import SDWebImage

class XTGameViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        iconImageView.layer.cornerRadius = iconImageView.frame.width*0.5
        iconImageView.layer.masksToBounds = true
  
    }
    
    
    // MARK:- 定义属性
    var gameItem : XTGameItem? {
        didSet {
            // 1.校验模型是否有值
            guard let gameItem = gameItem else {
                return
            }
            
            // 2.给imageView设置数据
            
            iconImageView.sd_setImageWithURL(NSURL(string: gameItem.icon_url), placeholderImage: UIImage(named: "live_cell_default_phone_103x103_"))
            
            nameLabel.text = gameItem.tag_name
            
        }
    }

}
