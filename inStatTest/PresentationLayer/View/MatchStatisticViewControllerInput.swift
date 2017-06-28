//
//  MatchStatisticViewControllerInput.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 28.06.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import Foundation

protocol MatchStatisticViewControllerInput {
    func reloadView()
    func stopActivityIndicator()
    func setFirstTeam(title: String)
    func setSecondTeam(title: String)
    func setupView(viewModel: MatchStatisticCellViewModel)
}
