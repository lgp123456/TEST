//
//  XTGameViewFlowLayout.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/29.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTGameViewFlowLayout: UICollectionViewFlowLayout {
    override func prepareLayout() {
        super.prepareLayout()
        
        let col : CGFloat = 3
        let magin : CGFloat = 10
        let width = (XTScreenW - (col - 1) * magin) / col - 20
        
        //设置cell的大小
        itemSize = CGSize(width: width, height: width)
        
        //设置cell的行间距
        minimumLineSpacing = magin
        //设置cell的列间距
        minimumInteritemSpacing = magin
        //设置cell两边的间距
        sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        //设置每一组header视图的尺寸
        headerReferenceSize = CGSize(width: 0, height: XTScreenW / 414 * 30)
    }
    
}
