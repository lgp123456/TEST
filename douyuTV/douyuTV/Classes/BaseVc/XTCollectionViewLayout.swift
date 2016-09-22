//
//  XTCollectionViewLayout.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

/////////////////////////////////////////////自定义布局/////////////////////////////////////////////////
import UIKit

class XTCollectionViewLayout: UICollectionViewFlowLayout {

    override func prepareLayout() {
        super.prepareLayout()
        //设置cell的大小
        itemSize = CGSize(width: XTScreenW, height: (XTScreenH))
        //设置collectionView滚动方向
        scrollDirection = .Horizontal
        //设置cell的行间距
        minimumLineSpacing = 0
        //设置cell的列间距
        minimumInteritemSpacing = 0
    
        collectionView?.backgroundColor  = UIColor.whiteColor()
    }
}
