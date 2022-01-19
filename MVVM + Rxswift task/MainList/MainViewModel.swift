//
//  MainViewModel.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay
import UIKit
import NVActivityIndicatorView

class MainViewModel {
    var fetchList:  PublishSubject<[ItemsModel]> = PublishSubject()
    var stackListService: StackListService!
    var testLocalDataManager: TestLocalDataManager!
    private let disposeBag = DisposeBag()
    let isLoading: ActivityIndicator =  ActivityIndicator()

    public init(_ service: StackListService = StackListService(), local: TestLocalDataManager = TestLocalDataManager()) {
        stackListService = service
        testLocalDataManager = local
    }
    func getStackList(min:Int, tagger:String){
        if Connectivity.isConnectedToInternet {
            stackListService.getStackList(min: min, tagger: tagger)
                .trackActivity(isLoading)
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { result in
                    guard let dataArr = result.items else {return}
                        self.fetchList.onNext(dataArr)
                        self.testLocalDataManager.deleteAllData(entity: "LocalStacklist")
                        for data in dataArr {
                            let title = data.title
                            let link = data.link
                            let dict = ["title": title, "link": link]
                            self.testLocalDataManager.savePost(dataDic: dict as [String : Any])
                        }
                }).disposed(by: disposeBag)
        }
    }
    func selectedModel(tableView:UITableView) {
        if Connectivity.isConnectedToInternet {
            tableView.rx.modelSelected(ItemsModel.self)
                        .subscribe(onNext: { model in
                            self.selectedLink(model: model)
                        }).disposed(by: disposeBag)
        }
    }
    func selectedLink(model: ItemsModel?){
        if model != nil {
            let link = model?.link
            if link != nil {
                if let url = URL(string: link!) {
                    UIApplication.shared.open(url)
                }
            }
        }
    }
    func toFilterVC(_ view:UIViewController){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FilterVC") as? FilterVC
        vc!.delegate = view as! getTagger
        view.navigationController?.pushViewController(vc!, animated: true)
    }
}
