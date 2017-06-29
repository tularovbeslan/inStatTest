//
//  MatchStatisticService.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 04.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

protocol MatchStatisticService {
    func updateMatchStatistic(_ completion:@escaping (StatisticResponse) -> Void)
}
