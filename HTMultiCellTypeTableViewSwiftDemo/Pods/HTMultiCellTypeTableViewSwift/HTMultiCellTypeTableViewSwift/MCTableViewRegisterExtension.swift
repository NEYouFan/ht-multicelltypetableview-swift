//
//  MCTableViewRegisterExtension.swift
//  MultiCellTypeTableViewSwift
//
//  Created by Baitianyu on 11/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    func register(_ cellClasses: [AnyClass]) {
        for cellClass in cellClasses {
            self.register(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
        }
    }
    
    func dequeueReusableCell(_ classType: AnyClass) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: NSStringFromClass(classType))!
    }
    
}
