//
//  ThreeViewController.swift
//  EmptyTableBarController
//
//  Created by bingoogol on 14-6-17.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ThreeViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let icon = UIImageView(image: UIImage(named:"excel.png"))
        icon.frame = CGRect(x:80,y:100,width:200,height:200)
        self.view.addSubview(icon)
    }
}