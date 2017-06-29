//
//  Mapper.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 07.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//
import SwiftyJSON

class MapperImplementation: Mapper {
    func map(data: Any?) -> StatisticResponse? {
        guard let map = data else {return nil}
        let json = JSON(map)
        var statistics: StatisticResponse?
        var teams = [Team]()
        var allPlayers = [String: PlayersResponse]()
        let numberOfCells = json["stats"][0]["teams"][0]["players"].arrayValue.count
        let numberOfStats = json["stats"].arrayValue.count
        for players in json["allPlayers"].arrayValue {
            allPlayers[players["playerId"].stringValue] = PlayersResponse(order: players["order"].intValue, playerId: players["playerId"].intValue, playerName: players["playerName"].stringValue)
        }
        
        for teamIndex in 0..<2 {
            var ar = [[String: Any]]()
            for playerIndex in 0..<numberOfCells {
                var dict = [String: Any]()
                for statIndex in 0...numberOfStats {
                    let column = "column\(statIndex)"
                    if statIndex == 0 {
                        dict[column] = allPlayers[json["stats"][statIndex]["teams"][teamIndex]["players"][playerIndex]["playerId"].stringValue]?.playerName
                    } else {
                        dict[column] = json["stats"][statIndex - 1]["teams"][teamIndex]["players"][playerIndex]["value"].floatValue
                    }
                }
                ar.append(dict)
            }
            teams.append(Team(statistic: ar))
        }
        statistics = StatisticResponse(teams: teams, team1: json["team1_name_eng"].stringValue, team2: json["team2_name_eng"].stringValue)
        return statistics
    }
}
