//
//  MainListTableViewCell.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import UIKit

class MainListTableViewCell: UITableViewCell {
    @IBOutlet weak var postLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func bindCell(_ data: ItemsModel?, dataLocal: ListCDModel?) {
        if data != nil {
            let text = data?.title
            postLbl.text = text ?? ""
        }
        if dataLocal != nil {
            let text = dataLocal?.title
            postLbl.text = text ?? ""
        }
    }
    
}
