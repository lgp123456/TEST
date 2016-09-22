//
//  XTFacePlayViewController.swift
//  douyuTV
//
//  Created by 李贵鹏 on 16/9/2.
//  Copyright © 2016年 李贵鹏. All rights reserved.
//

import UIKit
import IJKMediaFramework


class XTFacePlayViewController: UIViewController {
    
    var barrage : BarrageRenderer?
    
    var player : IJKFFMoviePlayerController?
    
    var addItem : XTAddLiveItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // 帧速率(fps) （可以改，确认非标准桢率会导致音画不同步，所以只能设定为15或者29.97）
//        [options setPlayerOptionIntValue:29.97 forKey:@"r"];
        // -vol——设置音量大小，256为标准音量。（要设置成两倍音量时则输入512，依此类推
//        [options setPlayerOptionIntValue:512 forKey:@"vol"];
        
//        let option = IJKFFOptions.optionsByDefault()
//        option.setPlayerOptionIntValue(1, forKey: "videotoolbox")
//        option.setPlayerOptionIntValue(19, forKey: "r")
//        option.setPlayerOptionIntValue(512, forKey: "vol")
    
        //利用ijkPlayer实现简单播放  注意: 一定要对播放器进行强引用
//        let url = NSURL(string: (addItem?.flv)!)
        let player = IJKFFMoviePlayerController(contentURLString: addItem!.flv, withOptions: nil)
        view.addSubview(player.view)
//        addChildViewController(player)
        self.player = player
        player.view.frame = self.view.bounds
//        player.shouldShowHudView = true
//        player.setPauseInBackground(true)
//        player.shouldAutoplay = false
        player.prepareToPlay()
        player.play()
        
           
        let btn = UIButton(frame: CGRect(x: 20, y: 20, width: 50, height: 30))
        btn.setTitle("返回", forState: .Normal)
        btn.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(XTFacePlayViewController.goBack), forControlEvents:.TouchUpInside)
    }
    
    deinit{
        player = nil
    }
    
    func goBack(){
//        player?.pause()
//        player?.stop()
//        player?.shutdown()
        dismissViewControllerAnimated(false, completion: nil)
    }
    
    //注意:IJKFFMoviePlayer 界面消失,一定要停止播放  还要暂停,因为只停止,会有延迟
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        player!.pause()
        player!.stop()
        player?.shutdown()
    }
}


// MARK: - 添加弹幕
extension XTFacePlayViewController {
    func setupBarrageRenderer(){
//        barrage = BarrageRenderer()
        barrage = BarrageRenderer()
 
        
    }
    
    
}
