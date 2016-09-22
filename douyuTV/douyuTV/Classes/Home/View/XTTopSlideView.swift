//
//  XTTopSlideView.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/30.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

private let ID = "topcell"

class XTTopSlideView: UIView {

    @IBOutlet weak var topCollectionView: UICollectionView!
    
    var groupArray = [XTGroupsItem]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topCollectionView.dataSource = self
        //注册cell
        topCollectionView.backgroundColor = UIColor.clearColor()
        
        topCollectionView.showsHorizontalScrollIndicator = false
        
        topCollectionView!.registerNib(UINib(nibName: "XTSlideCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:ID)
        
    }
    
    
    class func loadTopCollectionView() -> XTTopSlideView {

        return NSBundle.mainBundle().loadNibNamed("XTTopSlideView", owner: nil, options: nil).first as! XTTopSlideView
    }

}

// MARK: - 数据源方法
extension XTTopSlideView : UICollectionViewDataSource {
    
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        
        return groupArray.count ?? 0
    }
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID, forIndexPath: indexPath) as! XTSlideCollectionViewCell
        
        cell.groupItem = groupArray[indexPath.row]
        
        return cell
    }
}