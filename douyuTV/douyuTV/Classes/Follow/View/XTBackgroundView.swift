//
//  XTBackgroundView.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/25.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTBackgroundView: UIView {

    @IBOutlet weak var titleLabel: UILabel!

    
     class func loadBackgroundIconView() -> XTBackgroundView {
     
        return NSBundle.mainBundle().loadNibNamed("XTBackgroundView", owner: nil, options: nil).first as! XTBackgroundView
    }

}
