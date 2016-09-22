//
//  XTGameViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/25.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

private let reuseIdentifier = "gameCell"
private let gameID = "game"

class XTGameViewController: UICollectionViewController {
    
    private lazy var gameArray = [XTGameItem]()
    private lazy var groupArray = [XTGroupsItem]()
    
     var topSlideView = XTTopSlideView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //取消系统设置的内边距
        automaticallyAdjustsScrollViewInsets = false
        //设置内边距
        collectionView?.contentInset = UIEdgeInsets(top: 64 + 120 + 30, left: 0, bottom: 55, right: 0)
        //设置背景色
        collectionView?.backgroundColor = UIColor.clearColor()
        
        // 注册cell
        self.collectionView!.registerNib(UINib(nibName: "XTGameViewCell", bundle: nil), forCellWithReuseIdentifier:reuseIdentifier)
        //注册组的头部视图
         collectionView?.registerNib(UINib(nibName: "XTGameHeaderView", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: gameID)
        
        //加载数据
        loadData()
        
        addTopView()
    }
}

extension XTGameViewController {
    ///添加顶部的view
    private func addTopView() {
        
        let topHeaderView = XTTopHeaderView.loadGameHeaderView()
        topHeaderView.frame = CGRect(x: 0, y: -110, width: XTScreenW, height: 30)
//        topHeaderView.backgroundColor = UIColor.redColor()
        collectionView?.addSubview(topHeaderView)
        
        let topSlideView = XTTopSlideView.loadTopCollectionView()
        topSlideView.frame = CGRect(x: 0, y: -XTTopSpace/3, width: XTScreenW, height: XTTopSpace/3)
        
        self.topSlideView = topSlideView
        
        collectionView?.addSubview(topSlideView)
    }
}


// MARK: - 加载数据
extension XTGameViewController {
    ///加载数据
    private func loadData(){
        loadTopGameData()
        loadGameData()
    }
    
    ///加载顶部的数据
    private func loadTopGameData() {
        XTHttpManager.shareInstance.reqeustData(.GET, urlString: "http://capi.douyucdn.cn/api/v1/getHotCate?aid=ios&client_sys=ios&time=1468636740&auth=a326ef2a1a645e479a853e9486878776", parameters: nil) { (result, error) in
            //错误校验
            if error != nil {
                return
            }
//            result?.writeToFile("/Users/liguipeng/Desktop/game.plist", atomically: true)
            guard let resultArray = result!["data"]  as? [[String : NSObject]] else {
                return
            }
            for item in resultArray {
                self.groupArray.append(XTGroupsItem(dict: item))
            }
            
            
            self.topSlideView.groupArray = self.groupArray
            
            self.topSlideView.topCollectionView.reloadData()
    
        }
    }
    
    ///加载全部游戏数据
    private func loadGameData(){
        XTHttpManager.shareInstance.reqeustData(.GET, urlString: "http://capi.douyucdn.cn/api/v1/getColumnDetail?aid=ios&client_sys=ios&shortName=game&time=1468640760&auth=73e5e04ce9fc4eef33036c56707f53c5", parameters: nil) { (result, error) in
            //错误校验
            if error != nil {
                return
            }
//            result?.writeToFile("/Users/liguipeng/Desktop/allgame.plist", atomically: true)
            
            guard let resultArray = result!["data"]  as? [[String : NSObject]] else {
                return
            }
            for item in resultArray {
                self.gameArray.append(XTGameItem(dict: item))
            }
            
            self.collectionView?.reloadData()
        }
    }
}

// MARK:- 数据源方法
extension XTGameViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return gameArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! XTGameViewCell
        
        let gameItem = gameArray[indexPath.row]
        cell.gameItem = gameItem
        
        return cell
    }
}


// MARK:- 代理方法
extension XTGameViewController {
    //设置每一组的头部视图
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
         let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: gameID, forIndexPath: indexPath)
        
        
        return headerView
        
    }
}
