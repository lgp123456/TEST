//
//  XTBaseViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/24.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

class XTALLBaseLiveViewController: UIViewController {
    
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
extension XTALLBaseLiveViewController {
    ///设置顶部的标题栏
    func setupTopTitleView() {
        //创建毛玻璃效果
        
        let blur = UIBlurEffect(style: .ExtraLight)
        let effectView = UIVisualEffectView(effect: blur)
        effectView.frame = CGRect(x: 0, y: 0, width: XTScreenW, height: 64)
        //创建顶部工具栏
        let topTitleScrollView = UIScrollView(frame: CGRect(x: 0, y: 20, width: XTScreenW, height: 44))
        topTitleScrollView.scrollsToTop = false
        topTitleScrollView.backgroundColor = UIColor.clearColor()
        //添加按钮下面的黑线
        let lineView = UIView(frame: CGRect(x: 0, y: 43.5, width: topTitleScrollView.bounds.width, height: 0.5))
        //        lineView.backgroundColor = UIColor.lightGrayColor()
        lineView.backgroundColor = UIColor(red: 170 / 255.0, green: 170 / 255.0, blue: 170 / 255.0, alpha: 0.5)
        topTitleScrollView.addSubview(lineView)
        
        self.topScrollView = topTitleScrollView
        topScrollView?.showsHorizontalScrollIndicator = false
        effectView.addSubview(topTitleScrollView)
        
        view.addSubview(effectView)
    }
}

// MARK:- 设置UIcollectionView
extension XTALLBaseLiveViewController {
    
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
extension XTALLBaseLiveViewController {
    func setupAllTitleButton() {
        ////////////////////////////定义常量//////////////////////////
        let count = childViewControllers.count
        var btnX : CGFloat = 0
        let btnY : CGFloat = 0
        var btnW : CGFloat = 0
        let btnH =  topScrollView?.bounds.height
        var temp : CGFloat = 0
        ////////////////////////////创建并添加按钮到topScrollView上///////////////////////////////

        for i in 0..<count {
//            NSDictionary *nameAttr  = @{NSFontAttributeName : XMGNameFont};
//            CGSize nameSize = [self.name sizeWithAttributes:nameAttr];
//            CGFloat nameW = nameSize.width;
            let nameAttr = [NSFontAttributeName : UIFont.systemFontOfSize(17)]
            
            let vc = childViewControllers[i]
            let title = vc.title
            
            btnX = btnX + btnW
            btnW = (title! as NSString) .sizeWithAttributes(nameAttr).width + 20
        
            temp = temp + btnW
      
            let btn = UIButton()
//            btnX = CGFloat(i) * btnW
            btn.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH!)
            btn.tag = i
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
                let titleViewW : CGFloat = (btn.titleLabel?.bounds.width)!
                let titleViewH : CGFloat = 1.5
                let titleViewY : CGFloat = (topScrollView?.bounds.height)! - titleViewH - 0.5
                
                titleView.frame = CGRect(x: titleViewX, y: titleViewY, width: titleViewW, height: titleViewH)
                titleView.center.x = btn.center.x
                titleView.backgroundColor = UIColor.redColor()
                topScrollView?.addSubview(titleView)
                self.titleView = titleView
            }
            
            if i == 1 {
                btnClick(btn)
            }
        }
        topScrollView?.contentSize = CGSize(width: temp, height: (topScrollView?.frame.height)!)
    }
}

// MARK:- 设置按钮点击
extension XTALLBaseLiveViewController {
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
        
        if btn.center.x > XTScreenW*0.5  {
            UIView.animateWithDuration(0.25, animations: {
                self.topScrollView?.contentOffset.x = btn.center.x - XTScreenW*0.5
            })
            if btn.center.x > (topScrollView?.contentSize.width)! - XTScreenW*0.5{
                UIView.animateWithDuration(0.25, animations: {
                self.topScrollView?.contentOffset.x = (self.topScrollView?.contentSize.width)! - XTScreenW
                      })
            }
        }else{
            UIView.animateWithDuration(0.25, animations: {
                self.topScrollView?.contentOffset.x = 0
            })
        }
        
        UIView.animateWithDuration(0.25) {
            self.titleView?.bounds.size.width = btn.bounds.width
            self.titleView?.center.x = btn.center.x
        }
       
    }
}

// MARK:- UICollectionViewDataSource
extension XTALLBaseLiveViewController : UICollectionViewDataSource {
    //有多少个cell
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.childViewControllers.count
    }
    
    //设置cell的内容
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID, forIndexPath: indexPath)
        
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        //取出数组中的子控制器添加到cell上
        let vc  = childViewControllers[indexPath.row]
//        let collVc = vc as! UICollectionViewController
        
//        collVc.collectionView?.frame = UIScreen.mainScreen().bounds
                vc.view.frame = UIScreen.mainScreen().bounds
        
        
        //设置内边距  上边内间距 = 导航条高度 + 工具栏(标题栏)高度
        //        collectionView.contentInset = UIEdgeInsets(top: 64+35, left: 0, bottom: 49, right: 0)
        //        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.redColor() : UIColor.orangeColor()
        
        cell.contentView.addSubview((vc.view)!)
        
        return cell
    }
}

// MARK:- UICollectionViewDelegate
extension XTALLBaseLiveViewController : UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        guard let contnetOffetX = collectionView?.contentOffset.x else {
            return
        }
        let index  = Int(contnetOffetX / XTScreenW)
        
        selectButton(btnArray[index])
    }
}








