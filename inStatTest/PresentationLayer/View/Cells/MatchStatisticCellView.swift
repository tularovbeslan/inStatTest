//
//  MatchStatisticCell.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 05.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import UIKit

class MatchStatisticCellView: UITableViewCell {
    @IBOutlet var labels: [UILabel]!
    
    func setup(vm: MatchStatisticCellViewModel) {
        for collumn in labels {
            collumn.text = vm.setText(tag: collumn.tag, columns: labels.count)
        }
    }
}
