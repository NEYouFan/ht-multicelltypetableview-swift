//
//  MCTableBaseDescribeData.swift
//  MultiCellTypeTableViewSwift
//
//  Created by Baitianyu on 11/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

import UIKit

class MCTableBaseDescribeData: NSObject {

    var cellClass: AnyClass = UITableViewCell.self
    weak var cell: MCTableBaseCell?
    var customCellClosure: ((MCTableBaseCell, MCTableBaseDescribeData) -> ())?
    var selectCellClosure: ((MCTableBaseCell, MCTableBaseDescribeData) -> ())?
    
    override init() {
        super.init()
        customCellClosure = self.defaultCustomCellClosure()
    }
    
    func defaultCustomCellClosure() -> ((MCTableBaseCell, MCTableBaseDescribeData) -> ()) {
        let customClosure = {
            (cell: MCTableBaseCell, descirbeData: MCTableBaseDescribeData) -> () in
            self.cell = cell
            cell.describeData = self
        }
        return customClosure
    }
    
    func cellHeight() -> CGFloat {
        let size = cell?.sizeThatFits(CGSize(width: 0, height: 0))
        return (size?.height)!
    }
    
}
