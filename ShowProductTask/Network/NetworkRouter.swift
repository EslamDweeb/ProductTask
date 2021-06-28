//
//  NetworkClient.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import Foundation
import Alamofire


enum APIRouter : URLRequestConvertible {
    
    case getProducts
    var host:String{
        switch self {
        default:
            return "https://run.mocky.io/"
        }
    }
    private var Methods : HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    private var Paths : String {
        switch self {
        
        case .getProducts:
            return "v3/27867999-8b3e-4c04-a761-42def62ea1e8"
        }
    }
    //    private var headers : HTTPHeaders {
    //        switch self {
    //
    //        }
    //    }
    private var parameters :Parameters?{
        switch self {
        default :
            return nil
        }
    }
    private var bodyData:Data?{
        switch self {
        default :
            return nil
        }
        
    }
    func createStringUrl() -> String {
        switch self {
        default:
            let string              = host + Paths
            let endPointwithquery   = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let endPoint            = endPointwithquery?.replacingOccurrences(of:  "%5B%5D=", with: "=") ?? ""
            return endPoint
        }
    }
    func asURLRequest() throws -> URLRequest {
        let url = try createStringUrl().asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Methods.rawValue
        //urlRequest.headers = headers
        switch self {
        default:
            if  let parameters = parameters {urlRequest.httpBody = encodeParameters(parameters: parameters)}
            if  let bodyData = bodyData {urlRequest.httpBody = bodyData}
            print(urlRequest)
            print("method",Methods)
            //  print("header",headers)
            print("headers",urlRequest.allHTTPHeaderFields as Any)
            print("parameters",parameters ?? [:])
            print(String(data: urlRequest.httpBody ?? Data(), encoding: .utf8) ?? "")
            return urlRequest
        }
    }
    
    
    func encodeParameters(parameters:Parameters?)->Data?{
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters!, options: [])
            return data
        }catch{
            return nil
        }
    }
}
