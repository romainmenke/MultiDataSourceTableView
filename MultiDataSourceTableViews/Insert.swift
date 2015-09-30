//
//  Insert.swift
//  MultiDataSourceTableViews
//
//  Created by Romain Menke on 01/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit

class InsertViewController: IATableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func cellIdentifier(tableView: UITableView, isDataCell:Bool) -> String {
        switch isDataCell {
        case true :
            return "DataCell"
        case false :
            return "InsertCell"
        }
    }
    
    override func numberOfSections(tableView: UITableView) -> Int {
        
        return 3
    }
    
    override func numberOfRowsInSection(tableView: UITableView, section: Int) -> Int {
        return 9
    }
    
    override func insertXRowsEveryYSections(tableView: UITableView, section: Int) -> (numberOfRows: Int, afterSoManyRows: Int) {
        
        return (numberOfRows: 1, afterSoManyRows: 3)
    }
    
    override func dataCellForRowAtIndexPath(tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        cell.textLabel!.textColor = UIColor.blackColor()
        cell.textLabel!.text = "DATA CELL" + "          -> section: \(indexPath.section)" + " row: \(indexPath.row)"
        return cell
    }
    
    override func insertionCellForRowAtIndexPath(tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        cell.textLabel!.textColor = UIColor.blueColor()
        cell.textLabel!.text = "INSERTED CELL" + "  -> section: \(indexPath.section)" + " row: \(indexPath.row)"
        return cell
    }
    
    
}