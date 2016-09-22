//
//  XTAddLiveViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/9/2.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit

private let ID = "cell"

class XTAddLiveViewController: UITableViewController {
    
    lazy var dataArray = [XTAddLiveItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.lightGrayColor()

        loadDate()
        
        tableView.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 55, right: 0)
   
        tableView.registerNib(UINib(nibName: "XTLiveTableViewCell", bundle: nil), forCellReuseIdentifier: ID)
    }
}

// MARK: - 加载数据
extension XTAddLiveViewController {
    private func loadDate(){
        XTHttpManager.shareInstance.reqeustData(.GET, urlString:"http://live.9158.com/Fans/GetHotLive?page=2" , parameters: nil) { (result, error) in
            
           let a =  result?.writeToFile("/Users/liguipeng/Desktop/add.plist", atomically: true)
            print(a)
    
            guard let resultArray = result!["data"]!!["list"] as? [[String : NSObject]] else {
                return
            }
            
            for dict in resultArray {
                self.dataArray.append(XTAddLiveItem(dict: dict))
            }
         
            self.tableView?.reloadData()
        }
    }
}

// MARK: - 数据源方法
extension XTAddLiveViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return dataArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ID, forIndexPath: indexPath) as! XTLiveTableViewCell
        
       cell.addItem = dataArray[indexPath.row]
//        print(cell.addItem?.bigpic)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 465
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let playVc = XTFacePlayViewController()
        playVc.addItem = dataArray[indexPath.row]
        presentViewController(playVc, animated: false, completion: nil)
    }
}