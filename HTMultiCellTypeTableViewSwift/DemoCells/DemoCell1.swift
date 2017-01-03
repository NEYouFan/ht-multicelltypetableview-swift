//
//  DemoCell1.swift
//  MultiCellTypeTableViewSwift
//
//  Created by Baitianyu on 12/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

import UIKit

class DemoCell1: MCTableBaseCell {

    let headerIconImageView: UIImageView = UIImageView()
    let contentLabel: UILabel = UILabel()
    
    override var describeData: MCTableBaseDescribeData! {
        didSet {
            if describeData.isKind(of: DemoTableDescribeData.self) {
                let data: DemoTableDescribeData = describeData as! DemoTableDescribeData
                headerIconImageView.image = UIImage(named: data.headerIconName)
                contentLabel.text = data.content
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.loadSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadSubviews() {
        self.contentView.backgroundColor = UIColor.lightGray;
        
        self.contentView.addSubview(headerIconImageView)
        
        contentLabel.textColor = UIColor.black;
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.textAlignment = .left
        self.contentView.addSubview(contentLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentLabel.frame = CGRect(x: 120, y: 14, width: 100, height: 12)
        headerIconImageView.frame = CGRect(x: 10, y: 10, width: 25, height: 25)
    }
    
}
