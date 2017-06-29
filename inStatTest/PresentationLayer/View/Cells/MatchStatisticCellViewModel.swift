//
//  MatchStatisticCellViewModel.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 29.06.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import UIKit

class MatchStatisticCellViewModel {
    var rowHeight: CGFloat = 50

    private var teams: [Team]?
    private var index: Int!
    private var selectedTeam = 0
    
    init(teams: [Team]?) {
        self.teams = teams
    }
    
    func numberOfItems() -> Int {
        guard let teams = teams else { return 0 }
        return teams[selectedTeam].statistic?.count ?? 0
    }
    
    func setText(tag: Int, columns: Int) -> String {
        guard let teams = teams else { return "" }
        for _ in 0..<columns {
            switch tag {
            case 0:
                return String(describing: teams[selectedTeam].statistic![index]["column\(tag)"]!)
            case 2:
                return String(describing: teams[selectedTeam].statistic![index]["column\(tag)"]!)
            default:
                return String(describing: Int(teams[selectedTeam].statistic![index]["column\(tag)"] as! Float))
            }
        }
        return ""
    }
    
    func sort(tag: Int) {
        if tag != 0 {
            teams?[selectedTeam].statistic!.sort(by: { (a, b) -> Bool in
                return a["column\(tag)"] as! Float > b["column\(tag)"] as! Float
            })
        } else {
            teams?[selectedTeam].statistic!.sort(by: { (a, b) -> Bool in
                return b["column\(tag)"] as! String > a["column\(tag)"] as! String
            })
        }
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath, selectedTeam: Int) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: String(describing: MatchStatisticCellView.self), for: indexPath) as? MatchStatisticCellView)!
        index = indexPath.row
        self.selectedTeam = selectedTeam
        cell.setup(vm: self)
        return cell
    }
}
