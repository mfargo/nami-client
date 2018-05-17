//
//  ViewController.swift
//  NamiClient
//
//  Created by Matthew Fargo on 2018/05/16.
//  Copyright © 2018年 Matthew Fargo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollView:UIScrollView?

    override func viewDidLoad() {
        srand48(Int(floor(Date().timeIntervalSince1970)) )
        super.viewDidLoad()
        let pad:CGFloat = 40
        
        let userView = NMUserView(frame: CGRect(x: pad, y: pad, width: self.view.frame.size.width - pad*2, height: 40))
        scrollView?.addSubview(userView)
        var frame = userView.frame
        frame.origin.y += frame.size.height
        
        
        for category in NMSettings.categories {
            let cv = NMCategoryView(frame, category)
            scrollView?.addSubview(cv)
            frame.origin.y += cv.frame.size.height
        }
        scrollView?.contentSize = CGSize(width: 0, height: frame.origin.y + pad)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

