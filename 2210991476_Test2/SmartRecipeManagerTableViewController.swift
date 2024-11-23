//
//  SmartRecipeManagerTableViewController.swift
//  2210991476_Test2
//
//  Created by Dakshdeep Singh on 23/11/24.
//

import UIKit

class SmartRecipeManagerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBSegueAction func segueToDisplayRecipe(_ coder: NSCoder, sender: Any?) -> DisplayRecipeTableViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        let time = checkTime(indexPath.section)
        return DisplayRecipeTableViewController(recipe: meal[time]![indexPath.row], coder: coder)
    }
    
    @IBSegueAction func segueToAddRecipe(_ coder: NSCoder, sender: Any?) -> AddEditRecipeTableViewController? {
        return AddEditRecipeTableViewController(recipe: nil, coder: coder)
    }
    
    @IBAction func unwindToSmartRecipeManager(_ unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? AddEditRecipeTableViewController,
              let recipe = source.recipe
        else {
            return
        }
        
        if let indexPath = tableView.indexPathForSelectedRow {
//            meal[checkTime(indexPath.section)]![indexPath.row] = recipe
            meal[source.time]![indexPath.row] = recipe
            tableView.reloadRows(at: [indexPath], with: .none)
        } else {
            meal[source.time]!.append(recipe)
            let indexPath = IndexPath(row: meal.count - 1, section: 0)
            tableView.insertRows(at: [indexPath], with: .none)
        }
    }
    
    func checkTime(_ section: Int) -> time {
        if section == 0 {
            return .breakfast
        } else if section == 1 {
            return .lunch
        } else if section == 2 {
            return .dinner
        } else {
            return .snack
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meal.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let time = checkTime(section)
        return meal[time]!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! SmartRecipeManagerTableViewCell
        
//        if meal[checkTime(indexPath.section)]?.isEmpty == true {
//            return <#default value#>
//        }

        let recipe = meal[checkTime(indexPath.section)]![indexPath.row]
        cell.updateUI(recipe: recipe)

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
