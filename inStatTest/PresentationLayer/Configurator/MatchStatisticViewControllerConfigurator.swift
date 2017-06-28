//
//  MatchStatisticViewControllerConfigurator.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 28.06.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import UIKit

class MatchStatisticViewControllerConfigurator {
    
    func configureViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? MatchStatisticViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: MatchStatisticViewController) {
        
        let networkClient = NetworkClientImplementation()
        
        let mapper = MapperImplementation()
        
        let service = MatchStatisticServiceImplementation()
        service.networkClient = networkClient
        service.mapper = mapper
        
        let presenter = MatchStatisticPresentor()
        presenter.service = service
        presenter.view = viewController
        
        let viewModel = MatchStatisticCellViewModel(teams: nil)
        
        viewController.output = presenter
        viewController.viewModel = viewModel
        
    }
}
