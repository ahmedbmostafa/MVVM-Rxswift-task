//
//  GeneralFunctions.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import Foundation
import NVActivityIndicatorView

var generalFunctions: GeneralFunctions! = GeneralFunctions()
var activityIndicator : NVActivityIndicatorView?

class GeneralFunctions {

    func getOldDates()-> Int {
        var olderDays: Int
        let cal = Calendar.current
        var date = cal.startOfDay(for: Date())
        var days = [Int]()
        for _ in 1 ... 30 {
            let day = cal.component(.day, from: date)
            days.append(day)
            date = cal.date(byAdding: .day, value: -1, to: date)!
        }
        olderDays = Int(date.timeIntervalSince1970)
        return olderDays
    }
    func startAnimating(viewController: UIViewController) {
        let xAxis = viewController.view.center.x
        let yAxis = viewController.view.center.y
        let frame = CGRect(x: (xAxis - 50), y: (yAxis - 50), width: 90, height: 90)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator?.color = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        activityIndicator?.type = .ballRotateChase
        viewController.view.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
    }
    func stopAnimating() {
        activityIndicator?.stopAnimating()
    }
}
