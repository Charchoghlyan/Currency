//
//  WebServiceManager.swift
//  TestProject
//
//  Created by Sergey Charchoghlyan on 9/5/18.
//  Copyright © 2018 Sergey Charchoghlyan. All rights reserved.
//

import Foundation


class WebServiceManager {
    
    class func networkManager() -> NetworkManager {
        return NetworkManager()
    }
    
    
    class func getCurrency(_ completion: @escaping (CurrencyResponse?, String?) -> ()) {
        let network = self.networkManager()
        network.currencyRouter.request(CurrencyApi.getCurrency) { (data, response, error) in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse {
                let result = network.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        guard let json = jsonData as? [String:Any] else {return}
                        let cr = CurrencyResponse(withServerResponse: json)
                        completion(cr, nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    
    
}
