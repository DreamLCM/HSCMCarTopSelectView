//
//  ViewController.swift
//  HSCMCarTopSelectView
//
//  Created by CM on 2018/11/23.
//  Copyright © 2018 CM. All rights reserved.
//

import UIKit

class ViewController: UIViewController,HSCMCarTopSelectViewDataSource,HSCMCarTopSelectViewDelegate{

    let countButton = 4
    var showView: ViewShowSelectTips?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        
        
        let viewHSCMCarTopSelect = HSCMCarTopSelectView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 40), vc: self)
        viewHSCMCarTopSelect.dataSource = self
        viewHSCMCarTopSelect.delegate = self
        view.addSubview(viewHSCMCarTopSelect)
    
        
    }
    
    func createView() {
        showView = ViewShowSelectTips.init(frame: CGRect(x: 0, y: 140, width: view.bounds.width, height: 1))
        showView!.alpha = 1
        view.addSubview(showView!)
    }
    
    func removeView() {
        if showView != nil {
            showView!.removeFromSuperview()
            showView = nil
        } else {
            print("控件不存在，无需删除")
            return
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
    
    
    
    func selectOfItems(in pagerView: HSCMCarTopSelectView, btn: UIButton) {
        
        if btn.tag == 1000 {
            if btn.isSelected == true {
                self.removeView()
                print("show ====== \(self.showView)")
                btn.isSelected = false
                
                
            } else {
                self.removeView()
                self.createView()
                self.showView!.alpha = 1
                self.showView!.rowCount = 5
                self.showView!.height = 275
                print("show ====== \(self.showView)")
                btn.isSelected = true
                
                let action = CABasicAnimation(keyPath: "opacity")
                action.fromValue = 0
                action.toValue = 1
                action.duration = 0.3
                self.showView?.layer.add(action, forKey: nil)
                
            }
            
            /// 显示collectionView
        } else {
            
            if btn.isSelected == true {
                self.removeView()
                //                    self.showView!.alpha = 0
                //                    self.showView!.height = 0
                //                    self.showView!.sectionCount = 2
                btn.isSelected = false
            } else {
                self.removeView()
                self.createView()
                self.showView!.sectionCount = 2
                self.showView!.height = 2*44+36
                self.showView!.itemCount = 3
                btn.isSelected = true
                let action = CABasicAnimation(keyPath: "opacity")
                action.fromValue = 0
                action.toValue = 1
                action.duration = 0.3
                self.showView?.layer.add(action, forKey: nil)
                
            }
        }
        
        

    }
    
}
