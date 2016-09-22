//
//  XTNotOnAirViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTNotOnAirViewController: UICollectionViewController {
    
    private let liveingID = "notOnAirCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
     collectionView!.backgroundColor = UIColor.clearColor()
        
        //////////取消系统设置的内间距////////////
        automaticallyAdjustsScrollViewInsets = false
        //设置内间距
        collectionView?.contentInset = UIEdgeInsets(top: 64 + 35, left: 0, bottom: 49, right: 0)
        //注册cell
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: liveingID)
        
        //添加背景view
        setupBackgroundView()
    }
}

// MARK:- 设置背景view
extension XTNotOnAirViewController {
    func setupBackgroundView() {
        
        let backgroundView  = XTBackgroundView.loadBackgroundIconView()
        backgroundView.titleLabel.text = "暂无相关房间"
        collectionView?.backgroundView = backgroundView
    }
}

// MARK:- UICollectionViewDataSource
extension XTNotOnAirViewController {
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