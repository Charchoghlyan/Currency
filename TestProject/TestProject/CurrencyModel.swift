//
//  CurrencyModel.swift
//  TestProject
//
//  Created by Sergey Charchoghlyan on 9/5/18.
//  Copyright © 2018 Sergey Charchoghlyan. All rights reserved.
//

import Foundation


class CurrencyResponse: NSObject {
    
    var as_of: String?
    var currency: [Currency] = []
    
    override init() {
        super.init()
    }
    
    convenience init(withServerResponse response: Dictionary<String, Any>) {
        
        self.init()
        
        var resp = response
        
        if let as_of = resp["as_of"] as? String {
            self.as_of = as_of
        }
        
        if let stock = resp["stock"] as? Array<Dictionary<String,Any>> {
            for everyStock in stock {
                self.currency.append(Currency.init(withServerResponse: everyStock))
            }
        }
        
    }
    
}


class Currency: NSObject {
    
    var name: String?
    var percent_change: String?
    var price: Price?
    var symbol: String?
    var volume: Int?
    
    override init() {
        super.init()
    }
    
    convenience init(withServerResponse response: Dictionary<String, Any>) {
        
        self.init()
        
        var resp = response
        
        if let name = resp["name"] as? String {
            self.name = name
        }
        
        if let percent_change = resp["percent_change"] as? String {
            self.percent_change = percent_change
        }
        
        if let price = resp["price"] as? [String:Any] {
            self.price = Price(withServerResponse: price)
        }
        
        if let symbol = resp["symbol"] as? String {
            self.symbol = symbol
        }
        
        if let volume = resp["volume"] as? Int {
            self.volume = volume
        }
        
    }
    
}


class Price: NSObject {
    
    var amount: Double?
    var currency: String?
    
    override init() {
        super.init()
    }
    
    convenience init(withServerResponse response: Dictionary<String, Any>) {
        
        self.init()
        
        var resp = response
        
        if let amount = resp["amount"] as? Double {
            self.amount = amount
        }
        
        if let currency = resp["currency"] as? String {
            self.currency = currency
        }
        
    }
    
}
