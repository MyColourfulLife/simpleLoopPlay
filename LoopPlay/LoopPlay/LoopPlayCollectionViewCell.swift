//
//  LoopPlayCollectionViewCell.swift
//  LoopPlay
//
//  Created by 黄家树 on 2017/5/9.
//  Copyright © 2017年 huangjiashu. All rights reserved.
//

import UIKit

class LoopPlayCollectionViewCell: UICollectionViewCell {
    
    var imageView : UIImageView
    
    override init(frame: CGRect) {
        self.imageView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: frame.size))
        super.init(frame: frame)
        self.addSubview(self.imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func fillCell(image:UIImage) {
        self.imageView.image = image
    }
    
    
}
