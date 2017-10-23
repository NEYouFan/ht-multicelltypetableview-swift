//
//  ViewController.swift
//  MultiCellTypeTableViewSwift
//
//  Created by Baitianyu on 11/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

import UIKit
import HTMultiCellTypeTableViewSwift

class ViewController: UIViewController {

    let tableView: UITableView = UITableView()
    var cellDescriptionDatas: [[DemoTableDescribeData]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "MultiCellTypeTableViewSwift";
        self.view.backgroundColor = UIColor.white;
        
        self.loadSubviews()
        self.loadCellDescribeDatas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = self.view.bounds;
    }

    func loadSubviews() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.lightText
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        // register cell class, use UITableView+MCRegisterCellClass
        tableView.register([DemoCell1.self, DemoCell2.self, DemoCell3.self])
    }
    
    func loadCellDescribeDatas() {
        let cell1Data: DemoTableDescribeData = DemoTableDescribeData()
        cell1Data.cellClass = DemoCell1.self
        cell1Data.headerIconName = "header_icon"
        cell1Data.content = "cell1's content"
        
        let cell2Data: DemoTableDescribeData = DemoTableDescribeData()
        cell2Data.cellClass = DemoCell2.self
        cell2Data.title = "cell2";
        cell2Data.content = "cell2's content";
        cell2Data.switchStatus = true
        cell2Data.cell2Delegate = self
        
        let cell3Data: DemoTableDescribeData = DemoTableDescribeData()
        cell3Data.cellClass = DemoCell3.self
        cell3Data.indicateImageName = "indicate"
        cell3Data.title = "cell3"
        cell3Data.subTitle = "cell3's subtitle"
        
        cellDescriptionDatas = [[cell1Data, cell2Data], [cell3Data]]
    }
    
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data: DemoTableDescribeData = cellDescriptionDatas![indexPath.section][indexPath.row]
        let cell: UITableViewCell = tableView.dequeueReusableCell(data.cellClass)
        if cell.isKind(of: MCTableBaseCell.self) {
            let baseCell: MCTableBaseCell = cell as! MCTableBaseCell
            data.customCellClosure?(baseCell, data)
        }
        return data.cellHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data: DemoTableDescribeData = cellDescriptionDatas![indexPath.section][indexPath.row]
        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)
        if let _ = cell?.isKind(of: MCTableBaseCell.self) {
            let baseCell: MCTableBaseCell = cell as! MCTableBaseCell
            data.selectCellClosure?(baseCell, data)
        }
    }
    
}

extension ViewController : UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return cellDescriptionDatas!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDescriptionDatas![section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data: DemoTableDescribeData = cellDescriptionDatas![indexPath.section][indexPath.row]
        let cell: UITableViewCell = tableView.dequeueReusableCell(data.cellClass)
        if cell.isKind(of: MCTableBaseCell.self) {
            let baseCell: MCTableBaseCell = cell as! MCTableBaseCell
            data.customCellClosure?(baseCell, data)
        }
        
        return cell
    }
}

extension ViewController : MCDemoCell2Delegate {
    
    func switchStatusChanged() {
        print("cell2's switch status changed")
    }
    
}

