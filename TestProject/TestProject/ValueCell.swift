//
//  ValueCell.swift
//  TestProject
//
//  Created by Sergey Charchoghlyan on 9/5/18.
//  Copyright © 2018 Sergey Charchoghlyan. All rights reserved.
//

import UIKit

class ValueCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor.white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
