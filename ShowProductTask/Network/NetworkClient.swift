//
//  NetworkRouter.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import Foundation
import Alamofire

class NetworkClient {
    @discardableResult
    private static func `performRequest`<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,AFError>)->Void) -> DataRequest {
        return AF.request(route,
                          interceptor: nil)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T,AFError>) in
                print(response.response?.statusCode as Any)
                completion(response.result)
        }
    }
    
    static func getProduct(completion:@escaping (Result<ProductData,AFError>) -> Void){
        performRequest(route: APIRouter.getProducts, completion: completion)
    }
}
