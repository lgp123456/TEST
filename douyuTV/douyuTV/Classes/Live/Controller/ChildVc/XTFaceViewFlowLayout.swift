//
//  XTFaceViewFlowLayout.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/30.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTFaceViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepareLayout() {
        super.prepareLayout()
        
        let col : CGFloat = 2
        let magin : CGFloat = 10
        let width = (XTScreenW - (col - 1) * magin) / col - 10
        
        //设置cell的大小
        itemSize = CGSize(width: width, height: width*1.21 )
        
        //设置cell的行间距
        minimumLineSpacing = magin
        //设置cell的列间距
        minimumInteritemSpacing = magin
        //设置cell两边的间距
        sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
    }
    
}
