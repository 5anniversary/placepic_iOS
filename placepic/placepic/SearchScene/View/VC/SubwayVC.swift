//
//  SubwayVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/04.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SubwayVC: UITableViewController, UISearchResultsUpdating {
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    var searchData:[String] = []
    var searchData2:[String] = ["홍대입구","대흥","이수"]
    
    func updateSearchResults(for searchController: UISearchController) {
         filteredTableData.removeAll(keepingCapacity: false)
               
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (searchData as NSArray).filtered(using: searchPredicate)
               filteredTableData = array as! [String]
               
        self.tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchData.removeAll()
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        tableView.reloadData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (resultSearchController.isActive) {
            return filteredTableData.count
        } else {
            return searchData2.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubwayTVC.identifier, for: indexPath) 
        if (resultSearchController.isActive) {
            cell.textLabel?.text = filteredTableData[indexPath.row]
            
            return cell
        }
        else{
        // Configure the cell...
            let station = searchData2[indexPath.row]
            cell.textLabel?.text = station
//            cell.detailTextLabel?.text = item.name

            return cell
        }
    }


}
