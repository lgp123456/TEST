//
//  XTliveingViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTliveingViewController: UICollectionViewController {

     private let liveingID = "liveingCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.backgroundColor = UIColor.clearColor()
        //取消系统设置的内边距
        automaticallyAdjustsScrollViewInsets = false
        //设置内边距  上边内间距 = 导航条高度 + 工具栏(标题栏)高度
        collectionView?.contentInset = UIEdgeInsets(top: 64 + 35, left: 0, bottom: 49, right: 0)
        //注册cell
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: liveingID)
        //设置背景view
        setupBackgroundView()
    }
}

// MARK:- 设置背景view
extension XTliveingViewController {
    func setupBackgroundView() {
        
        let backgroundView  = XTBackgroundView.loadBackgroundIconView()
        collectionView?.backgroundView = backgroundView
    }
}


// MARK:- UICollectionViewDataSource
extension XTliveingViewController {
    //有多少个cell
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    //设置cell的内容
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(liveingID, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.orangeColor()
        
        return cell
    }
}