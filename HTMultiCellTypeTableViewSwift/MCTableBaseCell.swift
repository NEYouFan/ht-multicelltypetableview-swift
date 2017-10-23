//
//  MCTableBaseCell.swift
//  MultiCellTypeTableViewSwift
//
//  Created by Baitianyu on 11/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

import UIKit

open class MCTableBaseCell: UITableViewCell {

    open var describeData: MCTableBaseDescribeData?
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 44.0)
    }
    
}
