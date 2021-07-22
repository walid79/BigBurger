//
//  RestApiManager.swift
//  BigBurger
//
//  Created by walid nakbi on 22/7/2021.
//

import Foundation
import Foundation
import UIKit

enum HTTPMethod {
    case GET,POST,DELETE,PUT
    var value : String {
        switch self {
        case .GET:
            return "GET"
        case .POST:
            return "POST"
        case .DELETE:
            return "DELETE"
        case .PUT:
            return "PUT"
        }
    }
}
struct ResponseModel {
    let statusCode : Int
    let error : Error?
    let data : Data?
}
struct RequestModel {
    let url: String?
    var httpMethod: HTTPMethod = .GET
}
class RestApiManager 
{

    static let sharedInstance = RestApiManager()
    static let baseUrl = "https://bigburger.useradgents.com/"
    struct WS_Action {
        static  var LIST_Brgur = "catalog"
    }
   
    typealias CompletionHandler = ((_ response : ResponseModel?) -> Void)
    func sendRequestWithJsonResponse(requestObject: RequestModel,completionHandler:@escaping CompletionHandler) {
        guard let stringURL = requestObject.url,let serverURL = URL(string: stringURL) else {
            return
        }
        var urlRequest = URLRequest(url: serverURL)
        urlRequest.httpMethod = requestObject.httpMethod.value
        
        dump(urlRequest)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data,response,error) in
            if let responseObject = response as? HTTPURLResponse {
                print("statusCode : " + responseObject.statusCode.description)
                let responseModel = ResponseModel(statusCode: responseObject.statusCode, error: error, data: data)
                completionHandler(responseModel)
                return
            }
            completionHandler(nil)
        })
        task.resume()
        
    }
}
