//
//  MatchStatisticViewControllerInput.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 28.06.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

protocol MatchStatisticViewControllerInput: class {
    func reloadView()
    func stopActivityIndicator()
    func setFirstTeam(title: String)
    func setSecondTeam(title: String)
    func setupView(viewModel: MatchStatisticCellViewModel)
}
