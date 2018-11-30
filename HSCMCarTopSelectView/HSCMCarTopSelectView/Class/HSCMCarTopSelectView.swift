//
//  HSCMCarTopSelectView.swift
//  HSCMCarTopSelectView
//
//  Created by CM on 2018/11/23.
//  Copyright © 2018 CM. All rights reserved.
//

import UIKit

@objc
public protocol HSCMCarTopSelectViewDataSource: NSObjectProtocol {
    
    @objc(numberOfItemsHSCMCarTopSelectView:)
     /// 控件上按钮数组
    func numberOfItems(in pagerView: HSCMCarTopSelectView) -> Int
    
    @objc(titleOfItemsHSCMCarTopSelectView:)
     /// 控件上按钮文字数组
    func titleOfItems(in pagerView: HSCMCarTopSelectView) -> [String]
    
    @objc(imageOfItemsHSCMCarTopSelectView:)
    /// 控件上按钮图标数组
    optional func imageOfItems(in pagerView: HSCMCarTopSelectView) -> [String]
    
}

@objc
public protocol HSCMCarTopSelectViewDelegate: NSObjectProtocol {
    @objc(selectOfItemsHSCMCarTopSelectView::)
    /// 控件上按钮图标数组
    optional func selectOfItems(in pagerView: HSCMCarTopSelectView, btn: UIButton)
}

open class HSCMCarTopSelectView: UIView {
    

    open weak var dataSource: HSCMCarTopSelectViewDataSource?
    open weak var delegate: HSCMCarTopSelectViewDelegate?
    /// 按钮点击闭包
    var buttonClickClosure: ((Int)->Void)?
    /// 间距
    let paddingButton:CGFloat = 0
    /// 显示控件个数
    var numberItems = 0
    /// 控件上面文字数组
    var arrayTitle = [String]()
    /// 控件上面图片数组
    var arrayImage = [String]()
    
    init(frame: CGRect,vc: UIViewController) {
        super.init(frame: frame)
        
        if numberItems == arrayTitle.count {
            initView(frame: frame, vc: vc)
        } else {
            print("控件按钮数必须等于文字数组数量")
        }
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initView(frame: CGRect,vc: UIViewController) {
        
        backgroundColor = UIColor.green
        dataSource = vc as? HSCMCarTopSelectViewDataSource
        delegate = vc as? HSCMCarTopSelectViewDelegate
        
        numberItems = dataSource!.numberOfItems(in: self)
        arrayTitle = dataSource!.titleOfItems(in: self)
        arrayImage = dataSource!.imageOfItems!(in: self)
        
        let numberItemsCGFloat = CGFloat(numberItems-1)
        let numberItemsCGFloatAddOne = CGFloat(numberItems)
        
        for i in 0..<numberItems {
            let button = UIButton(frame: CGRect(
                x: CGFloat(i)*(self.bounds.width-numberItemsCGFloat*paddingButton)/numberItemsCGFloatAddOne+paddingButton*CGFloat(i),
                                                y: 0,
                                                width: (self.bounds.width-numberItemsCGFloat*paddingButton)/numberItemsCGFloatAddOne,
                                                height: frame.height))
            button.setTitle(arrayTitle[i], for: UIControl.State.normal)
            button.setTitleColor(UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1), for: UIControl.State.normal)
            button.tag = 1000+i
            button.titleLabel?.font = UIFont(name: "PingFangSC-Medium", size: 15)
            
            button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
            
            button.addTarget(self, action: #selector(buttonAction(btn:)), for: UIControl.Event.touchUpInside)
            self.addSubview(button)
            
            guard arrayImage.count == 0 else {
                button.setImage(UIImage(named: arrayImage[i]), for: UIControl.State.normal)
                continue
            }
            
        }
        
    }
    
    @objc func buttonAction(btn: UIButton) {
        delegate!.selectOfItems!(in: self, btn: btn)
    }
    

}
