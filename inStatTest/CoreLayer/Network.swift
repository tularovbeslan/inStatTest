//
//  NetworkClient.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 10.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import  Alamofire

protocol Network {
    func loadData(completion: @escaping (Result<Any>) -> Void)
}
