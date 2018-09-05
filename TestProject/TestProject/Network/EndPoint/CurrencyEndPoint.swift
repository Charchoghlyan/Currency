//
//  CurrencyEndPoint.swift
//  TestProject
//
//  Created by Sergey Charchoghlyan on 9/5/18.
//  Copyright © 2018 Sergey Charchoghlyan. All rights reserved.
//

import Foundation

public enum CurrencyApi {
    case getCurrency
}

extension CurrencyApi: EndPointType {
    
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getCurrency:
            return "stocks.json"
        }
    }
    
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getCurrency:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getCurrency:
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: headers)
        }
    }
    
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}


