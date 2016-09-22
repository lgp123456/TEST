//
//  XTHttpManager.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/8/25.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

/////////////////////////////////////////网络请求工具类/////////////////////////////////////////////////

import UIKit
import AFNetworking

enum RequestType {
    case GET
    case POST
}

class XTHttpManager: AFHTTPSessionManager {
    ///自定义单例
    static let shareInstance : XTHttpManager = {
        let manager = XTHttpManager()
        manager.responseSerializer.acceptableContentTypes?.insert("text/html")
        return manager
    }()
}

extension XTHttpManager {
    ///发送网络请求
    func reqeustData(type : RequestType, urlString : String, parameters : [String : NSObject]?, finishedCallback : (result : AnyObject?, error : NSError?) -> ()) {
        // 定义成功的闭包
        let successCallback = { (task : NSURLSessionDataTask, result : AnyObject?) in
            finishedCallback(result: result, error: nil)
        }
        
        // 定义失败的闭包
        let failureCallback = { (task : NSURLSessionDataTask?, error : NSError) in
            finishedCallback(result: nil, error: error)
        }
        
        // 发送网络请求
        if type == .GET {
            GET(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        } else {
            POST(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        }
    }
    
}