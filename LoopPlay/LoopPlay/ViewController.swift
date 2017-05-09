//
//  ViewController.swift
//  LoopPlay
//
//  Created by 黄家树 on 2017/5/9.
//  Copyright © 2017年 huangjiashu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView?
   
    var dataArr = Array<UIImage>()
    
    let cellRuse = "UICollectionViewCell"
    
    var i = 0;
    
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in ["timg-0","timg-1","timg-2"] {
            dataArr.append(UIImage(named: item)!)
        }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: view.frame.width, height: 300);
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 64, width: view.frame.width, height: 300), collectionViewLayout: flowLayout)
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        collectionView?.backgroundColor = UIColor.red
        collectionView?.delegate        = self
        collectionView?.dataSource      = self
        collectionView?.register(LoopPlayCollectionViewCell.self, forCellWithReuseIdentifier: cellRuse)
        self.view.addSubview(collectionView!)
       
        timer =  Timer(timeInterval: 1, repeats: true) { [unowned self] (timer) in
            //滚动图片
            let indexPath = IndexPath(item: self.i % self.dataArr.count, section: 0)
            self.collectionView?.scrollToItem(at: indexPath, at: .right, animated: true)
            self.i += 1
        }
        RunLoop.current.add(timer, forMode: .commonModes)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer.fireDate = Date.distantPast
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer.fireDate = Date.distantFuture
    }
}







extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : LoopPlayCollectionViewCell =  collectionView .dequeueReusableCell(withReuseIdentifier: cellRuse, for: indexPath) as! LoopPlayCollectionViewCell
        cell.fillCell(image: dataArr[indexPath.item])
        return cell
    }
}
