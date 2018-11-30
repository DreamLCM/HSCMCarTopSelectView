//
//  ViewShowSelectTips.swift
//  HSCMCarTopSelectView
//
//  Created by CM on 2018/11/27.
//  Copyright © 2018 CM. All rights reserved.
//

import UIKit

class ViewShowSelectTips: UIView {
    
    var fillColor = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var rowCount = 0 {
        didSet {
            addTableView()
        }
    }
    
    /// collectionView section
    var sectionCount = 0 {
        didSet {
            initCollectionView()
        }
    }
    
    var itemCount = 0 {
        didSet {
            initCollectionView()
        }
    }
    

    var tableViewSelect: UITableView!
    var collectionViewSelect: UICollectionView!
    // 初始化UICollectionViewFlowLayout.init对象
    let flowLayout = UICollectionViewFlowLayout()
    
    override func draw(_ rect: CGRect) {
        
        let pathRect = rect.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 0)
        fillColor.setFill()
        path.fill()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCollectionView()

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 添加表格
    func addTableView() {
        tableViewSelect = UITableView(frame: CGRect(x: 0, y: 0, width: Int(self.width), height: rowCount*55), style: .grouped)
        tableViewSelect.delegate = self
        tableViewSelect.dataSource = self
        self.addSubview(tableViewSelect)
        tableViewSelect.reloadData()
    }
    
    /// 初始化 collectionView
    func initCollectionView() {
        
        // 设置行间距
        flowLayout.minimumLineSpacing = 12
        // 设置列间距
        flowLayout.minimumInteritemSpacing = 12
        // 设置边界的填充距离
        flowLayout.sectionInset = UIEdgeInsets.init(top: 12, left: 12, bottom: 12, right: 0)
        // 给collectionView设置布局属性, 也可以通过init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)方法来创建一个UICollectionView对象
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionViewSelect = UICollectionView(frame: CGRect(x: 0, y: 0, width: Int(self.width), height: sectionCount*44+36), collectionViewLayout: flowLayout)
        collectionViewSelect.delegate = self
        collectionViewSelect.dataSource = self
        collectionViewSelect.register(UINib.init(nibName: "CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionViewSelect.backgroundColor = UIColor.white
        self.addSubview(collectionViewSelect)
        collectionViewSelect.reloadData()
        
    }
 
}


extension ViewShowSelectTips: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "默认排序"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
}


extension ViewShowSelectTips: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionCount
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return itemCount
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.width-CGFloat(3*12)-12)/3, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
    
    
    
}
