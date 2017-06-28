//
//  MatchStatisticServiceImplementation.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 07.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import Foundation

class MatchStatisticServiceImplementation: MatchStatisticService {

    var networkClient: Network!
    var mapper: Mapper!
    
    func updateMatchStatistic(_ completion: @escaping (StatisticResponse) -> Void) {
        networkClient.loadData { [unowned self] (result) in
            switch result {
            case .success:
                let mappedData = self.mapper.map(data: result.value)!
                completion(mappedData)
            case .failure:
                print("error handle")
            }
        }
    }
}
