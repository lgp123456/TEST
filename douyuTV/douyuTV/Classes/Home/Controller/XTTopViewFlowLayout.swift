//
//  XTTopViewFlowLayout.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/30.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTTopViewFlowLayout: UICollectionViewFlowLayout {

    override func prepareLayout() {
        super.prepareLayout()
        

        let itemWH : CGFloat = XTTopSpace / 3 
        
        //设置cell的大小
        itemSize = CGSize(width: itemWH, height: itemWH)
        
        //设置cell的行间距
        minimumLineSpacing = 0
        //设置cell的列间距
        minimumInteritemSpacing = 0
        
        scrollDirection = .Horizontal
     
    }
}
