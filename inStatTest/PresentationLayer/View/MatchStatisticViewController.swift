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

class MatchStatisticViewController: UIViewController, MatchStatisticViewControllerInput {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var output: MatchStatisticViewControllerOutput!
    var team: Int = 0
    var viewModel: MatchStatisticCellViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.prepareData()
        tableViewConfigure()
    }
    
    func tableViewConfigure() {
        tableView.tableFooterView = UIView()
    }
    
    //MARK: - MatchStatisticViewControllerInput
    func reloadView() {
        tableView.reloadData()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func setFirstTeam(title: String) {
        segmentedControl.setTitle(title, forSegmentAt: 0)
    }
    
    func setSecondTeam(title: String) {
        segmentedControl.setTitle(title, forSegmentAt: 1)
    }
    
    func setupView(viewModel: MatchStatisticCellViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: - Actions
    @IBAction func changeTeam(_ sender: UISegmentedControl) {
        team = sender.selectedSegmentIndex
        tableView.reloadData()
    }
}

extension MatchStatisticViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellInstance(tableView, indexPath: indexPath, selectedTeam: team)
    }
}

extension MatchStatisticViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: String(describing: MatchStatisticHeaderView.self)) as! MatchStatisticHeaderView
        headerView.delegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension MatchStatisticViewController: MatchStatisticHeaderViewDelegate {
    func columTapped(sender: UIButton) {
        viewModel.sort(tag: sender.tag)
        tableView.reloadData()
    }
}
