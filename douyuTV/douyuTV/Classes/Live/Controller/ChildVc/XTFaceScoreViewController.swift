//
//  XTFaceScoreViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/28.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

private let funID = "liveCell"
class XTFaceScoreViewController: UICollectionViewController {


    lazy var dataArray = [XTFunItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //取消系统设置的内边距
        // automaticallyAdjustsScrollViewInsets = false
        //设置内边距
        collectionView?.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 49, right: 0)
        //设置背景色
        collectionView?.backgroundColor = UIColor.clearColor()
        //注册cell
        self.collectionView!.registerNib(UINib(nibName: "XTFaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:funID)
        //加载网络数据
        loadFunData()
    }

}


// MARK: - 加载数据
extension XTFaceScoreViewController {
    
    private func loadFunData(){
        //        let parameters = ["limit" : 20 , "client_sys" : "ios" , "offset" : dataArray.count]
        
        XTHttpManager.shareInstance.reqeustData(.GET, urlString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/8?aid=ios&client_sys=ios&limit=20&offset=0&time=1469015520&auth=19d9ee69d294976b98b90b67a2ca9f94", parameters: nil) { (result, error) in
            //错误校验
            if error != nil {
                return
            }
//            result?.writeToFile("/Users/liguipeng/Desktop/face.plist", atomically: true)
            
            guard let resultArray = result!["data"] as? [[String : NSObject]] else {
                return
            }
            
            for dict in resultArray {
                self.dataArray.append(XTFunItem(dict: dict))
            }
            
            self.collectionView?.reloadData()
        }
    }
}




// MARK: - 数据源方法
extension XTFaceScoreViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArray.count ?? 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(funID, forIndexPath: indexPath) as! XTFaceCollectionViewCell
        
        let item = dataArray[indexPath.row]
        cell.funItem = item
        
        return cell
    }
}

