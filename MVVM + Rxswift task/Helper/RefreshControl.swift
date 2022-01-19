//
//  RefreshControl.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//


import UIKit

class DefaultRefreshControl: UIRefreshControl {

    private var refreshHandler: () -> Void

    // MARK: - Initializers

    init(tintColor: UIColor = .systemYellow,
         attributedTitle: String = "",
         backgroundColor: UIColor? = .clear,
         refreshHandler: @escaping () -> Void) {
        self.refreshHandler = refreshHandler
        super.init()
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Selectors

    @objc func refreshControlAction() {
        refreshHandler()
    }

}
