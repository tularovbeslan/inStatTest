//
//  MatchStatisticPresentor.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 07.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import Foundation

protocol MatchStatisticViewControllerProtocol: NSObjectProtocol {
    func getStatistic(_ statistics: [Team])
    func getTeamNames(_ names: [String])
}

class MatchStatisticPresentor {
    var viewData: MatchStatisticViewControllerProtocol!
    var service: MatchStatisticService!
    private var statistic: StatisticResponse?
    init(service: MatchStatisticService) {
        self.service = service
    }
    
    func loadData(completion: @escaping () -> Void) {
        service.updateMatchStatistic { [unowned self] (result) in
            guard let dataForCell = result.teams else {return}
            self.viewData.getStatistic(dataForCell)
            self.viewData.getTeamNames([result.team1!, result.team2!])
            completion()
        }
    }
}
