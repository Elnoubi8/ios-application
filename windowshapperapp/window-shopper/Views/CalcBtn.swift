//
//  CalcBtn.swift
//  window-shopper
//
//  Created by hax0r-MBP on 7/25/19.
//  Copyright © 2019 Devslopes. All rights reserved.
//

import UIKit

class CalcBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 0.5917804241, blue: 0.0205632858, alpha: 1)
        setTitle("Calculate", for: .normal)
        setTitleColor(.white, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
