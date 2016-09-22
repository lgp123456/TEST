//
//  XTheaderReusableView.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/29.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTheaderReusableView: UICollectionReusableView {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var arrowBtn: UIImageView!
    
    var groupItem : XTGroupsItem? {
        didSet{
                // 1.校验模型是否有值
                guard let groupItem = groupItem else {
                    return
            }
                titleLabel.text = groupItem.tag_name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
