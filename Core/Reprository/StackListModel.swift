//
//  StackListModel.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import Foundation

struct StackListModel:Decodable {
    var items: [ItemsModel]?
    var has_more: Bool?
    var quota_max: Int?
    var quota_remaining: Int?
}
struct ItemsModel:Decodable {
    var tags: [String]?
    var owner: OwnerModel?
    var title: String?
    var link: String?
}
struct OwnerModel:Decodable {
    var reputation: Int?
    var display_name: String?
    var profile_imag: String?
}


