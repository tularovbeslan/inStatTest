//
//  MatchStatisticViewControllerInitializer.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 28.06.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import UIKit

class MatchStatisticViewControllerInitializer: NSObject {
    @IBOutlet weak var matchStatisticViewController: MatchStatisticViewController!
    
    override func awakeFromNib() {
        let configurator = MatchStatisticViewControllerConfigurator()
        configurator.configureViewInput(viewInput: matchStatisticViewController)
    }
}
