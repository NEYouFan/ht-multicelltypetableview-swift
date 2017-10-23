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
    public var customCellClosure: ((MCTableBaseCell, MCTableBaseDescribeData) -> Void)?
    public var selectCellClosure: ((MCTableBaseCell, MCTableBaseDescribeData) -> Void)?
    
    override public init() {
        super.init()
        customCellClosure = self.defaultCustomCellClosure()
    }
    
    public convenience init(_ cellClass: AnyClass = UITableViewCell.self) {
        self.init()
        customCellClosure = self.defaultCustomCellClosure()
        self.cellClass = cellClass
    }
    
    private func defaultCustomCellClosure() -> ((MCTableBaseCell, MCTableBaseDescribeData) -> Void) {
        let customClosure = { (cell: MCTableBaseCell, descirbeData: MCTableBaseDescribeData) -> Void in
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
