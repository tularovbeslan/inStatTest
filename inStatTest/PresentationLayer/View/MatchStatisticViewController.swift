//
//  ViewController.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 04.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MatchStatisticViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: MatchStatisticPresentor?
    var team: Int = 0
    var cellViewData: [Team]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        presenter?.viewData = self
        presenter?.loadData {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func changeTeam(_ sender: UISegmentedControl) {
        team = sender.selectedSegmentIndex
        tableView.reloadData()
    }
}

extension MatchStatisticViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewData?[team].statistic?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchStatisticCellIdentifier) as! MatchStatisticCellView
        for collumn in cell.labels {
            switch collumn.tag {
            case 0:
                collumn.text = String(describing: cellViewData![team].statistic![indexPath.row]["column\(collumn.tag)"]!)
            case 2:
                collumn.text = String(describing: cellViewData![team].statistic![indexPath.row]["column\(collumn.tag)"]!)
            default:
                collumn.text = String(describing: Int(cellViewData![team].statistic![indexPath.row]["column\(collumn.tag)"] as! Float))
            }
        }
        return cell
    }
}

extension MatchStatisticViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: MatchStatisticHeaderIdentifier) as! MatchStatisticHeaderView
        headerView.delegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension MatchStatisticViewController: MatchStatisticHeaderViewDelegate {
    func columTapped(sender: UIButton) {
        sort(tag: sender.tag)
        tableView.reloadData()
    }
    
    func sort(tag: Int) {
        if tag != 0 {
            cellViewData![team].statistic!.sort(by: { (a, b) -> Bool in
                return a["column\(tag)"] as! Float > b["column\(tag)"] as! Float
            })
        } else {
            cellViewData![team].statistic!.sort(by: { (a, b) -> Bool in
                return b["column\(tag)"] as! String > a["column\(tag)"] as! String
            })
        }
    }
}

extension MatchStatisticViewController: MatchStatisticViewControllerProtocol {
    func getStatistic(_ statistics: [Team]) {
        cellViewData = statistics
    }
    
    func getTeamNames(_ names: [String]) {
        segmentedControl.setTitle(names[0], forSegmentAt: 0)
        segmentedControl.setTitle(names[1], forSegmentAt: 1)
    }
}
