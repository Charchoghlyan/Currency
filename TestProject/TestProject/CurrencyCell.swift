//
//  CurrencyCell.swift
//  TestProject
//
//  Created by Sergey Charchoghlyan on 9/5/18.
//  Copyright © 2018 Sergey Charchoghlyan. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func drawCell(currency: Currency) {
        name.text = currency.name
        if let volumeValue = currency.volume {
            volume.text = "\(volumeValue)"
        }
        amount.text = rounded(value: currency.price?.amount)
    }
    
    
    
    func rounded(value: Double?) -> String {
        guard let value = value else {return "0.00"}
        let divisor = pow(10.0, Double(2))
        let roundedDouble = (value * divisor).rounded() / divisor
        return "\(roundedDouble)"
    }

}
