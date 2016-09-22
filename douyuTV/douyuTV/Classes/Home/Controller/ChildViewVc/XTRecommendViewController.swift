//
//  XTRecommendViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/25.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit
import SDCycleScrollView

private let reuseIdentifier = "recommendCell"
private let faceID = "faceCell"
private let headerID = "gameHeader"

class XTRecommendViewController: UICollectionViewController {
    //懒加载轮播模型数据
    private lazy var carArray = [XTCarouselItem]()
    
    private lazy var groupArray = [XTGroupsItem]()
    
    private lazy var funArray = [XTFunItem]()
    
    //定义成员属性
    var topView : UIView?
    
    var topSlideView = XTTopSlideView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //取消系统设置的内边距
        automaticallyAdjustsScrollViewInsets = false
        //设置内边距   99=64+ XTTopViewH为导航条和标题栏的高度
        collectionView?.contentInset = UIEdgeInsets(top: XTTopSpace+64+XTTopViewH+10, left: 0, bottom: 49, right: 0)
        //设置背景色
        collectionView?.backgroundColor = UIColor.clearColor()
        //注册普通cell
        self.collectionView!.registerNib(UINib(nibName: "XTLiveCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:reuseIdentifier)
        //注册颜值cell
        self.collectionView!.registerNib(UINib(nibName: "XTFaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:faceID)
        //注册组的头部视图
        collectionView?.registerNib(UINib(nibName: "XTheaderReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        
        //添加顶部View
        addTopView()
        //加载轮播的数据
        loadCarouselData()
        loadHotData()
      
    }
}
// MARK:- 设置轮播图
extension XTRecommendViewController {
     ///添加顶部的view
    private func addTopView(){
        let topView = UIView()
        //设置frame   64+35 为导航条和标题栏的高度
        topView.frame = CGRect(x: 0, y: -XTTopSpace - 10, width:XTScreenW, height:(XTTopSpace))
        self.topView = topView
//        topView.backgroundColor = UIColor.redColor()
        collectionView?.addSubview(topView)
        addScrollView()
    }
    
    ///加载轮播的数据
    private func addCarousel() {
        //创建url数组
        var imageUrlArray = [String]()
        //创建标题数组
        var titleArray = [String]()
        //给标题数组,url数组添加元素
        for item in carArray {
            imageUrlArray.append(item.pic_url)
            titleArray.append(item.title)
        }
        //创建轮播图view
        let cycleScrollView = SDCycleScrollView(frame:CGRect(x: 0, y: 0, width: XTScreenW, height: XTTopSpace/3*2), delegate: nil, placeholderImage: UIImage(named:"默认banner图"))
        //给轮播图设置图片
        cycleScrollView.imageURLStringsGroup = imageUrlArray
        //设置轮播图的标题
        cycleScrollView.titlesGroup = titleArray
        //设置轮播图 pageControl居右，默认居中
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        //自定义轮播时间间隔
        cycleScrollView.autoScrollTimeInterval = 4.0
        //把轮播图添加到界面上
        topView!.addSubview(cycleScrollView)
   
    }
    
    ///添加轮播图下面的view
    private func addScrollView() {
        
        let topSlideView = XTTopSlideView.loadTopCollectionView()
        topSlideView.frame = CGRect(x: 0, y: XTTopSpace/3*2, width: XTScreenW, height: XTTopSpace/3)
        
        self.topSlideView = topSlideView
        
        topView?.addSubview(topSlideView)
    }
    
}

// MARK:- 加载最热数据
extension XTRecommendViewController {
    private func loadHotData() {
        
        XTHttpManager.shareInstance.reqeustData(.GET, urlString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom?aid=ios&client_sys=ios&time=1468636740&token=30890623_1b036814902f6451&auth=7d7026a323e09dd55c71ca215fc9d4b2", parameters: nil) { (result, error) in
            //错误校验
            if error != nil {
                print(error)
                return
            }
//            result?.writeToFile("/Users/liguipeng/Desktop/1.plist", atomically: true)
            
            guard let resultDict = result  as? [String : NSObject] else {
                return
            }
            
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else {
                return
            }
            //手动字典转模型
            for dict in dataArray {
                self.funArray.append(XTFunItem(dict: dict))
            }
            //把funArray包装成groupArray
            let item = XTGroupsItem(dict: ["tag_name" : "最热" , "funItems" : self.funArray])
            
            self.groupArray.append(item)
            
            self.loadFaceData()
       
        }
    }
    
    // MARK:- 加载颜值数据
    private func loadFaceData() {
        
        XTHttpManager.shareInstance.reqeustData(.GET, urlString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom?limit=4&client_sys=ios&offset=0", parameters: nil) { (result, error) in
            //错误校验
            if error != nil {
                print(error)
                return
            }
//            result?.writeToFile("/Users/liguipeng/Desktop/face.plist", atomically: true)
            guard let resultDict = result  as? [String : NSObject] else {
                return
            }
            
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else {
                return
            }
            //手动字典转模型
            //创建一个空的数组
            var tempArray = [XTFunItem]()
            for dict in dataArray {
                tempArray.append(XTFunItem(dict: dict))
            }
            //把tempArray包装成groupArray
            let item = XTGroupsItem(dict: ["tag_name" : "颜值" , "funItems" : tempArray])
            
            self.groupArray.append(item)
            
            self.loadGameData()
        }
    }
    
    // MARK:- 加载其它所有数据
    private func loadGameData() {
        
        XTHttpManager.shareInstance.reqeustData(.GET, urlString: "http://capi.douyucdn.cn/api/v1/getHotCate?aid=ios&client_sys=ios&time=1472044560&auth=b44ee3f89394cd075706b461e3b3e4a4", parameters: nil) { (result, error) in
            //错误校验
            if error != nil {
                print(error)
                return
            }
//            result?.writeToFile("/Users/liguipeng/Desktop/other.plist", atomically: true)
            guard let resultDict = result  as? [String : NSObject] else {
                return
            }
            
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else {
                return
            }
            //手动字典转模型
            for dict in dataArray {
                self.groupArray.append(XTGroupsItem(dict: dict))
            }
            
            self.collectionView?.reloadData()
            
            let item = XTGroupsItem(dict: ["tag_name" : "更多" ])
            //设置轮播器下面view的collectionView的数据
            self.topSlideView.groupArray = self.groupArray
            self.topSlideView.groupArray.append(item)
            self.topSlideView.groupArray.removeFirst(2)
            self.topSlideView.topCollectionView.reloadData()

        }
    }
}




// MARK:- 加载轮播数据
extension XTRecommendViewController {
    
    private func loadCarouselData(){
    
        XTHttpManager.shareInstance.reqeustData(.GET, urlString: "http://capi.douyucdn.cn/api/v1/slide/6?version=2.290&client_sys=ios", parameters: nil) { (result, error) in
            //错误校验
            if error != nil {
                print(error)
                return
            }
            
//            result?.writeToFile("/Users/liguipeng/Desktop/other.plist", atomically: true)
            guard let resultDict = result  as? [String : NSObject] else {
                return
            }
            
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else {
                return
            }
            //手动字典转模型
            for dict in dataArray {
                self.carArray.append(XTCarouselItem(dict: dict))
            }
            //字典转模型
            //            self.recArray = (XTCarouselItem.mj_objectArrayWithKeyValuesArray(result["data"]) as? [XTCarouselItem])!
           
            //添加轮播图控件 要保证拿到数据后在添加轮播图  加载数据是异步执行,所以放在里面执行这个方法
             self.addCarousel()
            
        }
    }
}

// MARK:- 数据源方法
extension XTRecommendViewController {
    //有多少组
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return groupArray.count ?? 0
    }
    //每一组多少行
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return groupArray[section].funItems.count ?? 0
    }
    //每个cell的内容
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if groupArray[indexPath.section].tag_name == "颜值" {
             let cell = collectionView.dequeueReusableCellWithReuseIdentifier(faceID, forIndexPath: indexPath) as! XTFaceCollectionViewCell
            
            let funArray = groupArray[indexPath.section].funItems
            cell.funItem = funArray[indexPath.row]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! XTLiveCollectionViewCell
            
            let funArray = groupArray[indexPath.section].funItems
            cell.funItem = funArray[indexPath.row]
            return cell
        }
    }
    
    //设置cell的尺寸
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize{
        if indexPath.section == 1 {
            let width = (XTScreenW -  10) * 0.5 - 10
            return CGSize(width: width, height: width*1.2 )
        }
        
        let width = (XTScreenW -  10) * 0.5 - 10
        
        //设置cell的大小
        return CGSize(width: width, height: width/3*2)
    }
    
}

// MARK:- 代理方法
extension XTRecommendViewController {
    
    //设置每一组的头部视图
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerID, forIndexPath: indexPath) as! XTheaderReusableView
        
        headerView.groupItem = groupArray[indexPath.section]
        
        if headerView.groupItem?.tag_name == "最热" {
            headerView.iconImageView.image = UIImage(named:"home_header_hot_18x18_" )
        }else if headerView.groupItem?.tag_name == "颜值"{
            headerView.iconImageView.image = UIImage(named:"home_header_phone_18x18_")
        }else{
            headerView.iconImageView.image = UIImage(named:"home_header_normal_18x18_")
        }
        
        return headerView
    }
}