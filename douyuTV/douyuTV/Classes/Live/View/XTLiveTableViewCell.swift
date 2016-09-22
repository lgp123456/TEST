//
//  XTLiveTableViewCell.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/9/2.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTLiveTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var lavelImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fansLabel: UILabel!
    @IBOutlet weak var bigImageView: UIImageView!
    
    
    // MARK:- 定义属性
    var addItem : XTAddLiveItem? {
        didSet {
            // 1.校验模型是否有值
            guard let addItem = addItem else {
                return
            }
            
            // 2.给imageView设置数据
            let url = NSURL(string: addItem.smallpic)
            iconImageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "dyla_直播结束背景图"))
            
            cityLabel.text = addItem.gps
            
            fansLabel.text = "\(addItem.allnum)"
            
            nameLabel.text = addItem.myname
            
            lavelImageView.image = UIImage(named:"girl_star\(addItem.starlevel)_40x19" )
            
            let bigurl = NSURL(string: addItem.bigpic)
            bigImageView.sd_setImageWithURL(bigurl, placeholderImage: UIImage(named: "dyla_直播结束背景图"))
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = iconImageView.frame.width*0.5
        iconImageView.layer.masksToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
