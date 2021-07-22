//
//  BurgerViewModel.swift
//  BigBurger
//
//  Created by walid nakbi on 22/7/2021.
//

import Foundation
final class BurgerViewModel {
    weak var service : BurgerListProtocol?
    var burger : Burger?
    var listBurger = [BurgerElement]()
    var onRefreshHandling : (() -> Void)?
    var onErrorHandling : ((ErrorResult?) -> Void)?
    init(service: BurgerListProtocol = BurgerListService.shared) {
        self.service = service
    }
    func getlistBurger(){
        service?.fetchCatalogBurger(completion: { (result) in
            switch result {
            case .success(let BurgerModel):
                
             
                self.listBurger.append(contentsOf :BurgerModel)
                  
                self.onRefreshHandling?()
                
            case .failure(let error):
                print(error)
                self.onErrorHandling?(ErrorResult.network(string: error.localizedDescription))
               
            }
        })
    }
}
extension BurgerViewModel {
    func numberOfBurger()-> Int {
        return listBurger.count
    }
    func BurgerIndex(at index: Int) -> BurgerElement?{
        if listBurger.indices.contains(index) {
            return listBurger[index]
        }
        return nil
    }
   func roundPrice()->String{
        for i in listBurger {
            let roundedVal = round(i.price * 1000) / 1000
            return String(roundedVal)
        }
    return ""
    }
}
