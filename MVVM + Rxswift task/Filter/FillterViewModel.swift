//
//  FillterViewModel.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import UIKit

class FillterViewModel {

    func toMainVC(_ view:UIViewController, min: Int, tagger: String){
        view.navigationController?.popViewController(animated: true)
    }
}
