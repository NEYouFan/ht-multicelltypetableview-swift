//
//  DemoCell3ViewModel.swift
//  MultiCellTypeTableViewSwift
//
//  Created by Baitianyu on 12/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

import UIKit

class DemoCell3ViewModel: NSObject {

    var title: String?
    var subTitle: String?
    var indicateImage: UIImage?
    
    convenience init(describeData: DemoTableDescribeData) {
        self.init()
        title = describeData.title;
        subTitle = describeData.subTitle;
        indicateImage = UIImage(named: describeData.indicateImageName)
    }
    
}
