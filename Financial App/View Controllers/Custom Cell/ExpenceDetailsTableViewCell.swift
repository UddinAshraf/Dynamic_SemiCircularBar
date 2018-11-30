//
//  ExpenxeDetailsTableViewCell.swift
//  Financial App
//
//  Created by BS126 on 11/8/18.
//  Copyright © 2018 BS23. All rights reserved.
//

import UIKit

class ExpenceDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var expenseNumberLabel: UILabel!
    @IBOutlet weak var expenseCategoryTitleLabel: UILabel!
    @IBOutlet weak var expenseCostAmountLabel: UILabel!
    @IBOutlet weak var percentOfTotalExpenseCostOnThiscategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
