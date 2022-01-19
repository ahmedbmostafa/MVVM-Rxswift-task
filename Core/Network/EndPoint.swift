//
//  EndPoint.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import Alamofire

let baseUrl = "https://api.stackexchange.com/2.2/questions/no-answers?"
struct Endpoint {
    let base: String
    let path: String
}
extension Endpoint {
    var url: String {
        return (base + path)
    }
}
var headers: HTTPHeaders {
    let header: HTTPHeaders = ["Username": "stackexchange",
                               "Password": "admin@123456",
                               "Content-Type":"application/json",
                               "Lang":"en",
                               "DeviceType":"IOS"
                                ]
        return header
}
