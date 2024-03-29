//
//  TVSearchBar.swift
//  SearchBar
//
//  Created by Alivelu Ravula on 4/10/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit

class TVSearchBar: UITableViewController,UISearchResultsUpdating {
    
    var actorsArray=["AmirKhan","Akshay kumar","Anil Kapoor","Sri Devi","sabita","manju","balu","kumar","gopi"]
    var filteredArray=[String]()
    var resultSC=UISearchController()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        resultSC=({
        
            
             let controller = UISearchController(searchResultsController: nil)
             controller.dimsBackgroundDuringPresentation=false
             controller.searchBar.sizeToFit()
                controller.searchResultsUpdater=self
                self.tableView.tableHeaderView=controller.searchBar
            
            return controller
        })()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.reloadData()
        
    }

   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(self.resultSC.isActive==true)
        {
        return  self.filteredArray.count
            
            
        }else{
        return self.actorsArray.count
        }
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    if(self.resultSC.isActive==true)
    {
        cell.textLabel?.text=filteredArray[indexPath.row]
        }
    else{
        cell.textLabel?.text=actorsArray[indexPath.row]
        
        }
        // Configure the cell...

        return cell
    }
    func updateSearchResults(for searchController: UISearchController) {
        
        filteredArray.removeAll(keepingCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF BEGINSWITH[c] %@", searchController.searchBar.text!)

        let array = (actorsArray as NSArray).filtered(using: searchPredicate)
        self.resultSC.searchBar.placeholder="result"
        filteredArray=array as! [String]
        self.tableView.reloadData()
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
