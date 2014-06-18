//
//  RootViewController.swift
//  Empty
//
//  Created by bingoogol on 14-6-17.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class RootViewController : UIViewController {
    
    var clickCount = 0
    // ?表示初始值为nil或没有设置 myLabel是可选的
    var myLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel = UILabel(frame:CGRect(x:0,y:100,width:155,height:44))
        myLabel!.text = "点击了\(clickCount)次"
        myLabel!.backgroundColor = UIColor.greenColor()
        self.view.addSubview(myLabel)
        
        let myButton = UIButton(frame:CGRect(x:170,y:100,width:155,height:44))
        myButton.setTitle("这是按钮",forState:.Normal)
        myButton.backgroundColor = UIColor.orangeColor()
        myButton.addTarget(self, action: "clickMyButton:", forControlEvents:.TouchUpInside)
        self.view.addSubview(myButton)
    }
    
    func clickMyButton(sender:UIButton) {
        clickCount++
        myLabel!.text = "点击了\(clickCount)次"
    }
}
