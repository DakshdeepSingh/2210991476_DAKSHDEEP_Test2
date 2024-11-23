//
//  DisplayRecipeTableViewController.swift
//  2210991476_Test2
//
//  Created by Dakshdeep Singh on 23/11/24.
//

import UIKit

class DisplayRecipeTableViewController: UITableViewController {
    
    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var recipeName: UILabel!
    @IBOutlet var recipeIngredients: UILabel!
    @IBOutlet var recipeInstruction: UILabel!
    @IBOutlet var recipeCategory: UILabel!
    @IBOutlet var recipeNutritionalInfo: UILabel!
    @IBOutlet var recipeCalorie: UILabel!
    
    var recipe: Recipe
    
    init?(recipe: Recipe, coder: NSCoder) {
        self.recipe = recipe
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBSegueAction func segueToEditRecipe(_ coder: NSCoder, sender: Any?) -> AddEditRecipeTableViewController? {
        return AddEditRecipeTableViewController(recipe: recipe, coder: coder)
    }
    
    func updateUI() {
        recipeImage.image = recipe.image ?? UIImage(systemName: "fork.knife.circle")
        recipeName.text = recipe.name
        recipeIngredients.text = "\(recipe.ingredients)"
        recipeInstruction.text = recipe.instructions
        recipeCategory.text = "\(recipe.category)"
        recipeNutritionalInfo.text = "\(recipe.nutritionalInfo)"
        recipeCalorie.text = "\(recipe.calories)"
    }

    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
