//
//  Mapper.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 10.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import Foundation

protocol Mapper {
    func map(data: Any?) -> StatisticResponse?
}
