//
//  XTBaseViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTBaseViewController: UIViewController {
    
    //定义重用标识
    let ID = "cell"
    // MARK:- 设置属性
    var collectionView : UICollectionView?
    var topScrollView : UIScrollView?
    var titleView : UIView?
    private lazy var btnArray = [UIButton]()
    var selBtn : UIButton?
    var isExist : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        setupCollectionView()
        setupTopTitleView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if isExist == false {
            setupAllTitleButton()
        }
        isExist = true
    }
    
}
// MARK:- 设置顶部的标题栏
extension XTBaseViewController {
    ///设置顶部的标题栏
    func setupTopTitleView() {
        
        let topTitleScrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width: XTScreenW, height: XTTopViewH))
        topTitleScrollView.scrollsToTop = false
        topTitleScrollView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        //设置菜单栏下面线的frame
        let lineView = UIView(frame: CGRect(x: 0, y: XTTopViewH-0.5, width: topTitleScrollView.bounds.width, height: 0.5))
//        lineView.backgroundColor = UIColor.lightGrayColor()
        lineView.backgroundColor = UIColor(red: 170 / 255.0, green: 170 / 255.0, blue: 170 / 255.0, alpha: 0.5)
        topTitleScrollView.addSubview(lineView)
        
        self.topScrollView = topTitleScrollView
        view.addSubview(topTitleScrollView)
    }
}

// MARK:- 设置UIcollectionView 
extension XTBaseViewController {
    
    ///设置UIcollectionView 
    func setupCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: XTCollectionViewLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //注册cell
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: ID)
        //开启分页
        collectionView.pagingEnabled = true
        //关闭弹簧效果
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        //关闭自动滚动到顶部
        collectionView.scrollsToTop = false
        self.collectionView = collectionView
        
        view.addSubview(collectionView)
    }
}

// MARK:- 添加所有的标题按钮
extension XTBaseViewController {
    func setupAllTitleButton() {
        ////////////////////////////定义常量//////////////////////////
        let count = childViewControllers.count
        var btnX : CGFloat = 0
        let btnY : CGFloat = 0
        let btnW = (topScrollView?.bounds.width)! / CGFloat(count)
        let btnH =  topScrollView?.bounds.height
        ////////////////////////////创建并添加按钮到topScrollView上///////////////////////////////
        for i in 0..<count {
            let btn = UIButton()
            btnX = CGFloat(i) * btnW
            btn.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH!)
            btn.tag = i
            let vc = childViewControllers[i]
            btn.setTitle(vc.title, forState: .Normal)
            btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            btn.setTitleColor(UIColor.redColor(), forState: .Selected)
            topScrollView?.addSubview(btn)
            btn.addTarget(self, action: #selector(XTBaseViewController.btnClick(_:)), forControlEvents: .TouchUpInside)
            
            self.btnArray.append(btn)
            
            ////////////////////////////////////设置按钮下面的指示器/////////////////////////////////////////
            if i == 0 {
                let titleView = UIView()
                let titleViewX : CGFloat = 0
                btn.titleLabel?.sizeToFit()
                let titleViewW : CGFloat = XTScreenW/CGFloat(self.childViewControllers.count)
                let titleViewH : CGFloat = 1.5
                let titleViewY : CGFloat = (topScrollView?.bounds.height)! - titleViewH                
                titleView.frame = CGRect(x: titleViewX, y: titleViewY, width: titleViewW, height: titleViewH)
                titleView.center.x = btn.center.x
                titleView.backgroundColor = UIColor.redColor()
                topScrollView?.addSubview(titleView)
                self.titleView = titleView
                btnClick(btn)
            }
        }
    }
}

// MARK:- 设置按钮点击
extension XTBaseViewController {
    ///监听按钮的点击
    func btnClick(btn : UIButton) {
        let index = CGFloat(btn.tag)
        selectButton(btn)
        collectionView?.setContentOffset(CGPointMake(index * XTScreenW, 0), animated: true)
    }
    ///设置按钮为选中状态
    func selectButton(btn : UIButton) {
        selBtn?.selected = false
        btn.selected = true
        selBtn = btn
        UIView.animateWithDuration(0.25) { 
            self.titleView?.center.x = btn.center.x
        }
    }
}

// MARK:- UICollectionViewDataSource
extension XTBaseViewController : UICollectionViewDataSource {
    //有多少个cell
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.childViewControllers.count ?? 0
    }
    
    //设置cell的内容
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID, forIndexPath: indexPath)
        
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        //取出数组中的子控制器添加到cell上
        let vc  = childViewControllers[indexPath.row]
        let collVc = vc as! UICollectionViewController
        
        collVc.collectionView?.frame = UIScreen.mainScreen().bounds
//        vc.view.frame = UIScreen.mainScreen().bounds
        
        
        //设置内边距  上边内间距 = 导航条高度 + 工具栏(标题栏)高度
//        collectionView.contentInset = UIEdgeInsets(top: 64+35, left: 0, bottom: 49, right: 0)
//        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.redColor() : UIColor.orangeColor()
        
        cell.contentView.addSubview((vc.view)!)
        
        return cell
    }
}

// MARK:- UICollectionViewDelegate
extension XTBaseViewController : UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        guard let contnetOffetX = collectionView?.contentOffset.x else {
            return
        }
        let index  = Int(contnetOffetX / XTScreenW)
        
       selectButton(btnArray[index])
    }
}








