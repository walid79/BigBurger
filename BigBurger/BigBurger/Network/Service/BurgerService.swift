//
//  BurgerService.swift
//  BigBurger
//
//  Created by walid nakbi on 22/7/2021.
//

import Foundation
protocol BurgerListProtocol :class {
   func  fetchCatalogBurger( completion: @escaping ((Result<Burger, ErrorResult>) -> Void))
}
final class BurgerListService : Parseable ,BurgerListProtocol{
    static let shared = BurgerListService()
    func fetchCatalogBurger( completion: @escaping ((Result<Burger, ErrorResult>) -> Void)) {
        let requestModel = RequestModel(url: RestApiManager.baseUrl + RestApiManager.WS_Action.LIST_Brgur)
        RestApiManager.sharedInstance.sendRequestWithJsonResponse(requestObject: requestModel){ (response) in
            guard let data = response?.data else {
                completion(.failure(.custom(string: response?.error.debugDescription ?? "Data not found")))
                return
            }
            
            self.parse(Burger.self, from: data, completion: completion)
        }
    }
}
