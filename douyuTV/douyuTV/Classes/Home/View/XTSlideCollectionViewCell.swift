//
//  XTSlideCollectionViewCell.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/30.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTSlideCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        iconImageView.layer.cornerRadius = iconImageView.frame.width*0.5
        iconImageView.layer.masksToBounds = true
        
    }
    
    
    // MARK:- 定义属性
    var groupItem : XTGroupsItem? {
        didSet {
            // 1.校验模型是否有值
            guard let groupItem = groupItem else {
                return
            }
            
            // 2.给imageView设置数据
            
            iconImageView.sd_setImageWithURL(NSURL(string: groupItem.icon_url), placeholderImage: UIImage(named: "live_cell_default_phone_103x103_"))
            
            nameLabel.text = groupItem.tag_name
            
        }
    }
}
