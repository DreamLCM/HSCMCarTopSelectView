//
//  ViewController.swift
//  HSCMCarTopSelectView
//
//  Created by CM on 2018/11/23.
//  Copyright © 2018 CM. All rights reserved.
//

import UIKit

class ViewController: UIViewController,HSCMCarTopSelectViewDataSource {

    let countButton = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewHSCMCarTopSelect = HSCMCarTopSelectView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 40), vc: self)
        viewHSCMCarTopSelect.dataSource = self
        view.addSubview(viewHSCMCarTopSelect)
        
        viewHSCMCarTopSelect.buttonClickClosure = {
            tag in
            print(tag)
        }
        
    }

    func numberOfItems(in pagerView: HSCMCarTopSelectView) -> Int {
        return countButton
    }
    
    func titleOfItems(in pagerView: HSCMCarTopSelectView) -> [String] {
        return ["默认排序","品牌","首付","筛选"]
    }
    
    func imageOfItems(in pagerView: HSCMCarTopSelectView) -> [String] {
        return ["select","select","select","screen"]
    }

}

