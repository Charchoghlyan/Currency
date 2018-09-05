//
//  CurrencyVC.swift
//  TestProject
//
//  Created by Sergey Charchoghlyan on 9/5/18.
//  Copyright © 2018 Sergey Charchoghlyan. All rights reserved.
//

import UIKit

class CurrencyVC: UIViewController {

    
    @IBOutlet weak var currencyTable: UITableView!
    
    var currency: [Currency] = [] {
        didSet {
            DispatchQueue.main.async {
                print(self.currency.count)
                self.currencyTable.reloadData()
            }
        }
    }
    
    var timerRequest: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currencyTable.delegate = self
        currencyTable.dataSource = self
        
        getCurrency()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timerRequest = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(updateCurrency), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timerRequest?.invalidate()
    }
    
    
    @objc func updateCurrency() {
        self.getCurrency()
    }
    
    func getCurrency() {
        WebServiceManager.getCurrency { (response, error) in
            if response != nil && error == nil {
                guard let currency = response?.currency else {return}
                self.currency = currency
            }
        }
    }

    @IBAction func refreshCurrency(_ sender: UIBarButtonItem) {
        self.getCurrency()
    }
    
}

extension CurrencyVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currency.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currencyCell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell") as! CurrencyCell
        currencyCell.selectionStyle = .none
        let cur = currency[indexPath.row]
        currencyCell.drawCell(currency: cur)
        return currencyCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "ValueCell") as! ValueCell
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
}






