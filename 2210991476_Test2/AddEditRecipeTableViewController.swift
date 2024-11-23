//
//  AddEditRecipeTableViewController.swift
//  2210991476_Test2
//
//  Created by Dakshdeep Singh on 23/11/24.
//

import UIKit

class AddEditRecipeTableViewController: UITableViewController {
    
    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var recipeName: UITextField!
    @IBOutlet var recipeCalories: UITextField!
    @IBOutlet var recipeTime: UITextField!
    @IBOutlet var recipeIngredient1: UITextField!
    @IBOutlet var recipeQuantity1: UITextField!
    @IBOutlet var recipeIngredient2: UITextField!
    @IBOutlet var recipeQuantity2: UITextField!
    @IBOutlet var recipeIngredient3: UITextField!
    @IBOutlet var recipeQuantity3: UITextField!
    @IBOutlet var recipeIngredient4: UITextField!
    @IBOutlet var recipeQuantity4: UITextField!
    @IBOutlet var recipeIngredient5: UITextField!
    @IBOutlet var recipeQuantity5: UITextField!
    @IBOutlet var recipeInstructions: UITextField!
    @IBOutlet var recipeCategory: UITextField!
    @IBOutlet var recipeNutritionalInfo: UITextField!
    @IBOutlet var breakfastSwitch: UISwitch!
    @IBOutlet var lunchSwitch: UISwitch!
    @IBOutlet var dinnerSwitch: UISwitch!
    @IBOutlet var snackSwitch: UISwitch!
    @IBOutlet var addRecipeButton: UIBarButtonItem!
    
    var recipe: Recipe?
    var time: time
    
    init?(recipe: Recipe?, coder: NSCoder) {
        if let recipe = recipe {
            self.recipe = recipe
        } else {
            self.recipe = nil
        }
        self.time = .breakfast
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRecipeButton.isEnabled = false
    }
    
    func updateUI() {
        guard let recipe = recipe else { return }
        
        recipeName.text = recipe.name
        recipeCalories.text = recipe.calories
        recipeTime.text = recipe.time
        
        if breakfastSwitch.isOn {
            time = .breakfast
        } else if lunchSwitch.isOn {
            time = .lunch
        } else if dinnerSwitch.isOn {
            time = .dinner
        } else {
            time = .snack
        }
        
        if recipe.ingredients.isEmpty == false {
            let count = recipe.ingredients.count
            
            var i = 0
            
            for key in recipe.ingredients.keys {
                switch i {
                    case 0:
                        recipeIngredient1.text = key
                        recipeQuantity1.text = String(describing: recipe.ingredients[key])
                    case 1:
                        recipeIngredient2.text = key
                        recipeQuantity2.text = String(describing: recipe.ingredients[key])
                    case 2:
                        recipeIngredient3.text = key
                        recipeQuantity3.text = String(describing: recipe.ingredients[key])
                    case 3:
                        recipeIngredient4.text = key
                        recipeQuantity4.text = String(describing: recipe.ingredients[key])
                    case 4:
                        recipeIngredient5.text = key
                        recipeQuantity5.text = String(describing: recipe.ingredients[key])
                    default:
                        break
                }
                
                i += 1
            }
        }
        
        recipeInstructions.text = recipe.instructions
        recipeCategory.text = recipe.category
        recipeNutritionalInfo.text = recipe.nutritionalInfo
    }
    
    func checkSwitch() {
        if breakfastSwitch.isOn {
            lunchSwitch.isOn = false
            dinnerSwitch.isOn = false
            snackSwitch.isOn = false
        } else if lunchSwitch.isOn {
            breakfastSwitch.isOn = false
            dinnerSwitch.isOn = false
            snackSwitch.isOn = false
        } else if dinnerSwitch.isOn {
            breakfastSwitch.isOn = false
            lunchSwitch.isOn = false
            snackSwitch.isOn = false
        } else {
            breakfastSwitch.isOn = false
            lunchSwitch.isOn = false
            dinnerSwitch.isOn = false
            snackSwitch.isOn = true
        }
    }
    
    @IBAction func textAdded(_ sender: UITextField) {
        if recipeName.text?.isEmpty == false,
//           recipeCalories.text?.isEmpty = false,
           recipeTime.text?.isEmpty == false,
           recipeInstructions.text?.isEmpty == false,
           recipeCategory.text?.isEmpty == false,
           recipeNutritionalInfo.text?.isEmpty == false,
           (recipeIngredient1.text?.isEmpty == false || recipeIngredient2.text?.isEmpty == false || recipeIngredient3.text?.isEmpty == false || recipeIngredient4.text?.isEmpty == false || recipeIngredient5.text?.isEmpty == false)
        {
            addRecipeButton.isEnabled = true
            recipe = Recipe(image: recipeImage.image ?? UIImage(systemName: "fork.knife.circle"), name: recipeName.text!, calories: recipeCalories.text!, time: recipeTime.text!, ingredients: [recipeIngredient1.text!: 100.0], instructions: recipeInstructions.text!, category: recipeCategory.text!, nutritionalInfo: recipeNutritionalInfo.text!, consumingTime: time)
        } else {
            addRecipeButton.isEnabled = false
        }
           
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
