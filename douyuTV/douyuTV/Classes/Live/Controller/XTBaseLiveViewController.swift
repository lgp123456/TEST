//
//  XTBaseLiveViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/28.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit
import MJRefresh

private let funID = "liveCell"

class XTBaseLiveViewController: UICollectionViewController {
    
    var url = "" {
        didSet{
             loadFunData()
        }
    }
    
    var bgImageView : UIImageView!
    
    lazy var dataArray = [XTFunItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgourdView()
        //取消系统设置的内边距
        // automaticallyAdjustsScrollViewInsets = false
        //设置内边距
         collectionView?.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 49, right: 0)
        //设置背景色
        collectionView?.backgroundColor = UIColor.clearColor()
        //注册cell
        self.collectionView!.registerNib(UINib(nibName: "XTLiveCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:funID)
        //加载网络数据
        loadFunData()
        setupRefresh()
//        collectionView?.mj_header.beginRefreshing()
    }
    
}

// MARK: - 上下拉刷新
extension XTBaseLiveViewController {
    func setupRefresh() {
        
        let header = MJRefreshGifHeader(refreshingTarget: self, refreshingAction: #selector(self.loadFunData))
        
        header.setImages([UIImage(named: "dyla_img_mj_stateIdle_64x66_")!], forState: .Idle)
        header.setImages([UIImage(named: "dyla_img_mj_statePulling_64x66_")!], forState: .Pulling)
        header.setImages([UIImage(named: "dyla_img_mj_stateRefreshing_01_135x66_")! ,
            UIImage(named: "dyla_img_mj_stateRefreshing_02_135x66_")! ,
            UIImage(named: "dyla_img_mj_stateRefreshing_03_135x66_")! ,
            UIImage(named: "dyla_img_mj_stateRefreshing_04_135x66_")!], duration: 0.25, forState: .Refreshing)
//        header.lastUpdatedTimeLabel.hidden = true
//        header.setTimeLabelHidden(true, forState: .Refreshing)
        collectionView?.mj_header = header
    }
}

// MARK: - 设置背景view
extension XTBaseLiveViewController {
    func setupBackgourdView() {
        let bgImageView = UIImageView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 151, height: 232)))
        bgImageView.contentMode = .Center
        bgImageView.center = view.center
        collectionView?.backgroundView = bgImageView
        let image1 = UIImage(named:"img_loading_1_151x232_")!
        let image2 = UIImage(named:"img_loading_2_151x232_")!
        bgImageView.animationImages = [image1,image2]
        bgImageView.animationRepeatCount = 0
        bgImageView.animationDuration = 0.5
        bgImageView.startAnimating()
        self.bgImageView = bgImageView
    }

}

// MARK: - 加载数据
extension XTBaseLiveViewController {
    
     func loadFunData(){
//        let parameters = ["limit" : 20 , "client_sys" : "ios" , "offset" : dataArray.count]
        dataArray.removeAll()
        
        XTHttpManager.shareInstance.reqeustData(.GET, urlString: url, parameters: nil) { (result, error) in
            //错误校验
            if error != nil {
                return
            }
            
            guard let resultArray = result!["data"] as? [[String : NSObject]] else {
                return
            }
            
            for dict in resultArray {
                self.dataArray.append(XTFunItem(dict: dict))
            }
            
            self.collectionView?.reloadData()
            self.collectionView?.mj_header.endRefreshing()
            self.bgImageView.hidden = true
        }
    }
}




// MARK: - 数据源方法
extension XTBaseLiveViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArray.count ?? 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(funID, forIndexPath: indexPath) as! XTLiveCollectionViewCell
        
        cell.funItem = dataArray[indexPath.row]
        
        return cell
    }
}
