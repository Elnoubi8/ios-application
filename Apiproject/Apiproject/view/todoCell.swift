//
//  todoCell.swift
//  Apiproject
//
//  Created by Elnoby on 3/30/20.
//  Copyright © 2020 elnoubi. All rights reserved.
//

import UIKit

class todoCell: UITableViewCell {

    
    @IBOutlet weak var textLb: UILabel!
    
    @IBOutlet weak var coloview: UIView!
    
    func updateCell(Todo : Todo){
        textLb.text = Todo.item
        switch Todo.priority {
        case 0:
            coloview.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            break
        case 1:
            coloview.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            break
        default:
            coloview.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }

    

}
