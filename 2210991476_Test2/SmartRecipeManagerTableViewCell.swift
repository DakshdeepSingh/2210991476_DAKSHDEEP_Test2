//
//  SmartRecipeManagerTableViewCell.swift
//  2210991476_Test2
//
//  Created by Dakshdeep Singh on 23/11/24.
//

import UIKit

class SmartRecipeManagerTableViewCell: UITableViewCell {

    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var recipeName: UILabel!
    @IBOutlet var recipeCalorieTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(recipe: Recipe) {
        if let image = recipe.image {
            recipeImage.image = image
        }
        recipeName.text = recipe.name
        recipeCalorieTime.text = "Calories: \(recipe.calories) | \(recipe.time)"
    }

}
