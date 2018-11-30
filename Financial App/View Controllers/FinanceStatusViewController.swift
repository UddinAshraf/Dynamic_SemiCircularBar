//
//  FinanceStatusViewController.swift
//  Financial App
//
//  Created by BS126 on 11/8/18.
//  Copyright © 2018 BS23. All rights reserved.
//

import UIKit

class FinanceStatusViewController: UIViewController {

    @IBOutlet weak var dateColectionView: UICollectionView!
    @IBOutlet weak var dayExpenseLabel: UILabel!
    @IBOutlet weak var progressBar: CircleProgressView!
    @IBOutlet weak var progressPercentTitlelabel: UILabel!
    @IBOutlet weak var expenseDetailsTableView: UITableView!

    var selectedIndex = 0
    var dateDataList: [DateData] = [
                                    DateData(dateTitle: "12",spendingMoney: 1875),
                                    DateData(dateTitle: "13",spendingMoney: 354),
                                    DateData(dateTitle: "14",spendingMoney: 1356),
                                    DateData(dateTitle: "15",spendingMoney: 2280),
                                    DateData(dateTitle: "16",spendingMoney: 2500),
                                    DateData(dateTitle: "17",spendingMoney: 0),
                                    DateData(dateTitle: "18",spendingMoney: 0),
                                    
                                   ]
    var expenseDetailsList: [SpentData] = [
                                    SpentData(spentCategoryTitle: "Travel", spentAmount: "$740", spentPercent: "30%"),
                                    SpentData(spentCategoryTitle: "Food", spentAmount: "$540", spentPercent: "30%"),
                                    SpentData(spentCategoryTitle: "Entertainment", spentAmount: "$440", spentPercent: "30%")
                                   ]
    
    var progressBarCounter: Float = 0.0 {
        didSet {
            //progressBar.progress = 0.0
            configureCircleProgressbar()
        }
    }
    var timer: Timer!
    var progressCounter: Float = 0
    let duration = 1.0
    var progressTimeUpperBound:Float = 0.60
    var progressInreament: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //configureCircleProgressbar()
        calculateProgressbarCounter()
       expenseDetailsTableView.tableFooterView = UIView.init(frame: .zero)
    }
}

//MARK: UIcollectionView Datsource and Delgate meethods
extension FinanceStatusViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return dateDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell", for: indexPath) as! WeekDayCollectionViewCell
        
        let row = indexPath.row
        cell.backgroundColor = row == selectedIndex ? UIColor.hexStringToUIColor(hex: "759FD9").withAlphaComponent(0.5) : UIColor.clear
        cell.dateLabel.text = dateDataList[indexPath.row].dateTitle
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        self.dayExpenseLabel.text = "$\(Int(dateDataList[indexPath.row].spendingMoney!))"
        dateColectionView.reloadData()
        calculateProgressbarCounter()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 24, height: 24)
     }
    
}

//MARK: UITAbleView Datasource and delegate method
extension FinanceStatusViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseDetailsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpeneseDetailCell", for: indexPath) as? ExpenceDetailsTableViewCell else {
            return UITableViewCell.init()
        }
        cell.selectionStyle = .none
        let row = indexPath.row
        cell.expenseNumberLabel.text = String(row + 1)
        cell.expenseCategoryTitleLabel.text = expenseDetailsList[row].spentCategoryTitle
        cell.expenseCostAmountLabel.text = expenseDetailsList[row].spentAmount
        cell.percentOfTotalExpenseCostOnThiscategoryLabel.text = expenseDetailsList[row].spentPercent
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

//MARK: CircleProgressBAr related Method
extension FinanceStatusViewController {
    
    func calculateProgressbarCounter() {
        progressBarCounter = (dateDataList[selectedIndex].spendingMoney! * 100) / 2500
        progressPercentTitlelabel.text = "\(Int(progressBarCounter))%"
    }
    
    func configureCircleProgressbar() {
        //progressInreament = Float(1.0 / duration)
        progressInreament = 0.0
        progressCounter = 0.0
        progressTimeUpperBound = progressBarCounter / 100.0
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.showProgress), userInfo: nil, repeats: true)
    }
    
    @objc func showProgress() {
        
        print(progressCounter , progressInreament)
        if progressInreament >= progressTimeUpperBound {
            timer.invalidate()
        }
        progressCounter = (0.5 * progressInreament)
        progressBar.progress = progressCounter
        progressInreament = progressInreament + 0.01
        
        //progressCounter = (0.5 * progressBarCounter / 100.0)//progressCounter + progressInreament
        //progressBar.progress = progressCounter
    }
}
