//
//  MatchStatisticPresentor.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 07.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

class MatchStatisticPresentor: MatchStatisticViewControllerOutput {
    weak var view: MatchStatisticViewControllerInput!
    var service: MatchStatisticService!
    private var statistic: StatisticResponse?
    
    func prepareData() {
        service.updateMatchStatistic { [weak self] (result) in
            guard let firstTeam = result.team1 else {return}
            self?.view.setFirstTeam(title: firstTeam)
            
            guard let secondTeam = result.team2 else {return}
            self?.view.setSecondTeam(title: secondTeam)
            
            guard let teams = result.teams else {return}
            let viewModel = MatchStatisticCellViewModel(teams: teams)
            self?.view.setupView(viewModel: viewModel)
            self?.view.stopActivityIndicator()
            self?.view.reloadView()
        }
    }
}
