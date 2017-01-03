//
//  DemoCell3.swift
//  MultiCellTypeTableViewSwift
//
//  Created by Baitianyu on 12/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

import UIKit

class DemoCell3: MCTableBaseCell {

    let indicateImageView: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let subTitleLabel: UILabel = UILabel()
    var viewModel: DemoCell3ViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            subTitleLabel.text = viewModel?.subTitle
            indicateImageView.image = viewModel?.indicateImage
        }
    }
    
    override var describeData: MCTableBaseDescribeData! {
        didSet {
            if describeData.isKind(of: DemoTableDescribeData.self) {
                let data: DemoTableDescribeData = describeData as! DemoTableDescribeData
                let viewModel: DemoCell3ViewModel = DemoCell3ViewModel(describeData: data)
                self.viewModel = viewModel
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
        self.contentView.backgroundColor = UIColor.yellow
        
        self.contentView.addSubview(indicateImageView)
        
        titleLabel.textColor = UIColor.red
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textAlignment = .left
        self.contentView.addSubview(titleLabel)
        
        subTitleLabel.textColor = UIColor.blue
        subTitleLabel.font = UIFont.systemFont(ofSize: 10)
        subTitleLabel.textAlignment = .left
        self.contentView.addSubview(subTitleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 10, y: 15, width: 100, height: 18)
        subTitleLabel.frame = CGRect(x: 10, y: 40, width: 100, height: 11)
        indicateImageView.frame = CGRect(x: 150, y: 10, width: 33, height: 33)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: 0, height: 80)
    }
}
