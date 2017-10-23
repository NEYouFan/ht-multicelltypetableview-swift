//
//  DemoCell2.swift
//  MultiCellTypeTableViewSwift
//
//  Created by Baitianyu on 12/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

import UIKit
import HTMultiCellTypeTableViewSwift

protocol MCDemoCell2Delegate {

    func switchStatusChanged()

}

class DemoCell2: MCTableBaseCell {

    let titleLabel: UILabel = UILabel()
    let contentLabel: UILabel = UILabel()
    let rightSwitchButton: UISwitch = UISwitch()
    var delegate: MCDemoCell2Delegate?

    override var describeData: MCTableBaseDescribeData! {
        didSet {
            if describeData.isKind(of: DemoTableDescribeData.self) {
                let data: DemoTableDescribeData = describeData as! DemoTableDescribeData
                titleLabel.text = data.title
                contentLabel.text = data.content
                rightSwitchButton.setOn(data.switchStatus, animated: false)
                delegate = data.cell2Delegate
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
        self.contentView.backgroundColor = UIColor.purple;
        
        titleLabel.textColor = UIColor.red;
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textAlignment = .left;
        self.contentView.addSubview(titleLabel)
        
        contentLabel.textColor = UIColor.black;
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.textAlignment = .left
        self.contentView.addSubview(contentLabel)
        
        rightSwitchButton.addTarget(self, action: #selector(swithcStatusChanged), for: .touchUpInside)
        self.contentView.addSubview(rightSwitchButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 10, y: 8, width: 80, height: 18)
        contentLabel.frame = CGRect(x: 120, y: 14, width: 130, height: 12)
        rightSwitchButton.frame = CGRect(x: 280, y: 5, width: rightSwitchButton.bounds.size.width, height: rightSwitchButton.bounds.size.height)
    }
    
    func swithcStatusChanged() {
        delegate?.switchStatusChanged()
    }

}
