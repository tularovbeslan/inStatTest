//
//  MatchStatisticHeaderView.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 06.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import UIKit

protocol MatchStatisticHeaderViewDelegate {
    func columTapped(sender: UIButton)
}

class MatchStatisticHeaderView: UITableViewCell {
    var delegate: MatchStatisticHeaderViewDelegate?
    @IBOutlet var columnButtons: [UIButton]!
    
    override func awakeFromNib() {
        for button in columnButtons {
            button.titleLabel?.numberOfLines = 3
            button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        }
    }
    
    func tapped(button sender: UIButton) {
        self.delegate?.columTapped(sender: sender)
    }
}
