//
//  XTTopHeaderView.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/30.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTTopHeaderView: UIView {
    
    class func loadGameHeaderView() -> XTTopHeaderView {
        
        return NSBundle.mainBundle().loadNibNamed("XTTopHeaderView", owner: nil, options: nil).first as! XTTopHeaderView
    }

}
