//
//  StackListService.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import RxSwift

class StackListService {
    private let network: Networking
    public init(_ client: Networking = NetworkClient()) {
        network = client
    }
    func getStackList(min:Int, tagger:String) -> Observable<StackListModel>{
        let url = Endpoint.getStackList(min: min, tagger: tagger).url        
        return network.request(method: .get, url: url, parameters: nil, headers: headers, type: StackListModel.self)
    }
}
