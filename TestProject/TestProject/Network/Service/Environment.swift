//
//  Environment.swift
//  TestProject
//
//  Created by Sergey Charchoghlyan on 9/5/18.
//  Copyright © 2018 Sergey Charchoghlyan. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case development
    case staging
}

var environmentBaseURL : String {
    switch NetworkManager.environment {
    case .production: return "http://phisix-api3.appspot.com/"
    case .development: return ""
    case .qa: return ""
    case .staging: return ""
    }
}
