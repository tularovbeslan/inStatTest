//
//  Assembly.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 09.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.storyboardInitCompleted(MatchStatisticViewController.self) { (r, c) in
            c.presenter = r.resolve(MatchStatisticPresentor.self)
        }
        
        defaultContainer.register(MatchStatisticPresentor.self) { r in
            MatchStatisticPresentor(service: r.resolve(MatchStatisticServiceImplementation.self)!)
        }
        
        defaultContainer.register(MatchStatisticServiceImplementation.self) { r in
            MatchStatisticServiceImplementation(networkClient: r.resolve(Network.self)!, mapper: r.resolve(Mapper.self)!)
        }
        
        defaultContainer.register(Network.self) { _ in NetworkClientImplementation() }
        defaultContainer.register(Mapper.self) { _ in MapperImplementation() }
    }
}
