//
//  Network.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import RxSwift
import RxCocoa
import Alamofire

enum NetworkMethod {
    case get, post, put, delete
}

protocol Networking {
    func request<D: Decodable>(method: NetworkMethod, url: String, parameters: [String : Any]?, headers: HTTPHeaders?, type: D.Type) -> Observable<D>
    func request(method: NetworkMethod, url: String, parameters: [String : Any]?,headers: HTTPHeaders?) -> Observable<Data>
}

extension Networking {
    func request<D: Decodable>(method: NetworkMethod, url: String, parameters: [String : Any]?, headers: HTTPHeaders?, type: D.Type) -> Observable<D> {
        return request(method: method, url: url, parameters: parameters, headers: headers).map { data in
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                throw NetworkError.IncorrectDataReturned
            }
        }
    }

    func request(method: NetworkMethod, url: String, parameters: [String : Any]?, headers: HTTPHeaders?) -> Observable<Data> {
        return Observable.create { observer in
            let method = method.httpMethod()
            let request = AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default ,headers: headers)
                .response { response in
                    switch response.result {
                    case .success:
                        if response.response?.statusCode == 200 {
                            let data = response.data!
                            observer.onNext(data)
                            observer.onCompleted()
                        }
                        else {
                            let error = response.error
                            debugPrint(error)
                        }
                    case .failure(let error):
                        debugPrint(error)
                        observer.onError(NetworkError(error: error))
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
fileprivate extension NetworkMethod {
    func httpMethod() -> HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }
}
struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}
