//
//  ViewController.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import UIKit
import RxSwift


class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: MainViewModel! = MainViewModel()
    private let disposeBag = DisposeBag()
    var dataItems = [ItemsModel]()
    var min = 5
    var tagger = "swift"

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        binding()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidAppear(_ animated: Bool) {
            getStackList(min: min, tagger: tagger)
    }
    func getStackList(min:Int, tagger: String) {
        animateLoader()
        viewModel.getStackList(min: min, tagger: tagger)
        tableView.refreshControl?.endRefreshing()
    }
    func binding() {
        if Connectivity.isConnectedToInternet {
            viewModel.fetchList
                .bind(to: tableView.rx.items(cellIdentifier: String(describing: MainListTableViewCell.self), cellType: MainListTableViewCell.self)) { row, element, cell in
                    cell.bindCell(element, dataLocal: nil)
                }
                .disposed(by: disposeBag)
            self.viewModel.selectedModel(tableView: self.tableView)
        }else {
            viewModel.testLocalDataManager.retrievePostList()!
                .bind(to: tableView.rx.items(cellIdentifier: String(describing: MainListTableViewCell.self), cellType: MainListTableViewCell.self)) { row, element, cell in
                    var localModel: ListCDModel
                    let title = element.title
                    let link = element.link
                    localModel = ListCDModel(title: title!, link: link!)
                    cell.bindCell(nil, dataLocal: localModel)
                }
                .disposed(by: disposeBag)
            self.viewModel.selectedModel(tableView: self.tableView)
            view.makeToast("Check Internet Connection")
        }
    }
    @IBAction func filterBtnTapped(_ sender: Any) {
        if Connectivity.isConnectedToInternet {
            viewModel.toFilterVC(self)
        }else {
            view.makeToast("Check Internet Connection")
        }
    }
    func setUpTableView(){
        setupRefreshControl()
        tableView.registerNib(identifier: "MainListTableViewCell")
    }
    func setupRefreshControl() {
        tableView.refreshControl = DefaultRefreshControl(tintColor: .systemYellow,
                                    backgroundColor: tableView.backgroundColor,
                                    refreshHandler: { [weak self] in
                                    guard let self = self else {return}
                                    if Connectivity.isConnectedToInternet {
                                        self.getStackList(min: self.min, tagger: self.tagger)
                                        } else {
                                            self.tableView.refreshControl?.endRefreshing()
                                            self.view.makeToast("Check Internet Connection")
                                        }})
    }
    func animateLoader(){
        viewModel.isLoading
            .distinctUntilChanged()
            .drive(onNext: { [weak self] (isLoading) in
                guard let `self` = self else { return }
                generalFunctions.stopAnimating()
                if isLoading {
                    generalFunctions.startAnimating(viewController: self)
                }
            })
            .disposed(by: disposeBag)
    }
}

extension MainVC: getTagger {
    func getData(min: Int, tagger: String) {
        self.min = min
        self.tagger = tagger
    }
}
