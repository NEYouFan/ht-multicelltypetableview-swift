//
//  MCTableBaseDescribeData.swift
//  MultiCellTypeTableViewSwift
//
//  Created by Baitianyu on 11/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

import UIKit

open class MCTableBaseDescribeData: NSObject {

    public var cellClass: AnyClass = UITableViewCell.self
    public weak var cell: MCTableBaseCell?
    public var customCellClosure: ((MCTableBaseCell, MCTableBaseDescribeData) -> ())?
    public var selectCellClosure: ((MCTableBaseCell, MCTableBaseDescribeData) -> ())?
    
    override public init() {
        super.init()
        customCellClosure = self.defaultCustomCellClosure()
    }
    
    private func defaultCustomCellClosure() -> ((MCTableBaseCell, MCTableBaseDescribeData) -> ()) {
        let customClosure = { (cell: MCTableBaseCell, descirbeData: MCTableBaseDescribeData) -> () in
            self.cell = cell
            cell.describeData = self
        }
        return customClosure
    }
    
    open func cellHeight() -> CGFloat {
        let size = cell?.sizeThatFits(CGSize(width: 0, height: 0))
        return (size?.height)!
    }
    
}
