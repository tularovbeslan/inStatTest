//
//  NetworkClient.swift
//  inStatTest
//
//  Created by BESLAN TULAROV on 07.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import Alamofire

class NetworkClientImplementation: Network {
    
    let url = "https://gist.githubusercontent.com/tularovbeslan/f8d08339879951995f30a755de351945/raw/53d144f80b851cac6344e9a04928e1016165744a/json"
    
    func loadData(completion: @escaping (Result<Any>) -> Void) {
        Alamofire.request(url).responseJSON { (response) in
            completion(response.result)
        }
    }
}
