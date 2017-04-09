//
//  NetworkClient.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 07.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import Foundation
import Alamofire

class NetworkClient {
    func loadData(completion: @escaping (Result<Any>) -> Void) {
        Alamofire.request(urlString).responseJSON { (response) in
            completion(response.result)
        }
    }
}
