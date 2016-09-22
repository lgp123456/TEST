//
//  XTEntertainmentViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/25.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit
import SDWebImage

private let enterID = "EnterCell"
private let headerID = "gameHeader"

class XTEntertainmentViewController: UICollectionViewController {

    private lazy var dataArray = [XTGroupsItem]()
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //取消系统设置的内边距
        automaticallyAdjustsScrollViewInsets = false
        //设置内边距
        collectionView?.contentInset = UIEdgeInsets(top: (XTTopSpace/3*2+64+XTTopViewH+10), left: 0, bottom: 49, right: 0)
        //设置背景色
        collectionView?.backgroundColor = UIColor.clearColor()
        
        collectionView?.delegate = self
        //注册cell
        self.collectionView!.registerNib(UINib(nibName: "XTLiveCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:enterID)
        //注册组的头部视图
        collectionView?.registerNib(UINib(nibName: "XTheaderReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        
        loadEnterData()
        
    }
}

// MARK: - 添加顶部的scrollerView
extension XTEntertainmentViewController {
    private func addTopScrollView(){
        let topView = UIScrollView()
        topView.delegate = self
        
        //开启分页效果
        topView.pagingEnabled = true
        
        //设置frame   64+35 为导航条和标题栏的高度
        topView.frame = CGRect(x: 0, y: (-XTTopSpace/3*2-10), width:XTScreenW, height:(XTTopSpace/3*2))
        
        var tempArray = dataArray
        tempArray.removeFirst()
         
        let count = tempArray.count
        let row : CGFloat = 2
        let col : CGFloat = 4
        let wigth = XTScreenW / col
        let btnWH = (topView.frame.height - 10) / row
        let magin = (wigth - btnWH) * 0.5
        let height = (topView.frame.height - 20) / row
        
        for i in 0..<count {
            let index = CGFloat(topView.subviews.count)
            let btn = XTEnterBtn()
            let n  = CGFloat(i/8)
            
            let btnY = CGFloat(Int(index-n*8) / Int(col)) * height + 10
   
            let btnX = n*XTScreenW + CGFloat(Int(index) % Int(col))  * wigth + magin
            
            btn.setTitle(tempArray[i].tag_name, forState: .Normal)
            
            btn.imageView?.sd_setImageWithURL(NSURL(string: tempArray[i].icon_url))
            

            
            let image = SDImageCache.sharedImageCache().imageFromDiskCacheForKey(tempArray[i].icon_url)
            btn.setImage(image, forState: .Normal)
            
//            if index / col >= 2 {
//                btnX = CGFloat(Int(index) % Int(col)) * height + magin+n*XTScreenW
//                btnY = CGFloat(Int(index-8) / Int(col)) * wigth + 10
//         
//            }

            btn.frame = CGRect(x: btnX, y: btnY, width: btnWH, height: btnWH)
            topView.addSubview(btn)
        }
        //取消水平滚动条
        topView.showsHorizontalScrollIndicator = false
        //设置scrollView的滚动范围
        let m = tempArray.count / 8
        topView.contentSize = CGSize(width:(XTScreenW * CGFloat(m+1)) , height: topView.frame.height)
        
        //添加分页器
        let pageControl = UIPageControl()
        self.pageControl = pageControl
        //设置页码指示器选中和非选中的颜色
        pageControl.currentPageIndicatorTintColor = UIColor.orangeColor()
        pageControl.pageIndicatorTintColor = UIColor.grayColor()
        pageControl.frame = CGRectMake(0,-30, topView.frame.width, 20);
        //设置当前页
        pageControl.currentPage = 0
        //设置总页数  不设置默认为0   即不显示分页
        pageControl.numberOfPages = m + 1
        //把pageControl添加到collectionView上
        collectionView!.addSubview(pageControl)
        collectionView?.addSubview(topView)
 
    }
}

// MARK: - 加载数据
extension XTEntertainmentViewController {
    
    private func loadEnterData(){
//        let parameters = ["limit" : 20 , "client_sys" : "ios" , "offset" : dataArray.count]
        
        XTHttpManager.shareInstance.reqeustData(.GET, urlString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2?aid=ios&client_sys=ios&time=1472045700&auth=e3026b945461af531b086b4f9927ab95", parameters: nil) { (result, error) in
            //错误校验
            if error != nil {
                return
            }
//            result?.writeToFile("/Users/liguipeng/Desktop/enter.plist", atomically: true)
            
            guard let resultArray = result!["data"]  as? [[String : NSObject]] else {
                return
            }
            for item in resultArray {
                self.dataArray.append(XTGroupsItem(dict: item))
            }
            
            self.collectionView?.reloadData()
            self.addTopScrollView()
        }
    }
}

// MARK: - 数据源方法
extension XTEntertainmentViewController {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
             return dataArray.count ?? 0
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray[section].room_list!.count ?? 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(enterID, forIndexPath: indexPath) as! XTLiveCollectionViewCell
        
        let funArray = dataArray[indexPath.section].funItems
        cell.funItem = funArray[indexPath.row]
        return cell
    }
}

// MARK:- 代理方法
extension XTEntertainmentViewController {
    
    //设置每一组的头部视图
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {

        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerID, forIndexPath: indexPath) as! XTheaderReusableView
        
        headerView.groupItem = dataArray[indexPath.section]
        
        if headerView.groupItem?.tag_name == "最热" {
            headerView.iconImageView.image = UIImage(named:"home_header_hot_18x18_" )
        }else{
            headerView.iconImageView.image = UIImage(named:"home_header_normal_18x18_")
        }
        return headerView
    }
}

// MARK: - scrollerView代理方法
extension XTEntertainmentViewController  {
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / XTScreenW + 0.5)
        self.pageControl.currentPage = page
    }
}