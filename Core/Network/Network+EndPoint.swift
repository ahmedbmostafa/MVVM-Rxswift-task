//
//  Network+EndPoint.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import Foundation

extension Endpoint {
    static func getStackList(min: Int, tagger: String)-> Endpoint {
        let base = baseUrl
        let currentDate = Int(Date().timeIntervalSince1970)
        let olderDays = generalFunctions.getOldDates()
        let path = "min=\(min)&tagged=\(tagger)&fromdate=\(olderDays)&todate=\(currentDate)&order=asc&sort=votes&site=stackoverflow"
        return Endpoint(base: base,
                        path: path)
    }
}

