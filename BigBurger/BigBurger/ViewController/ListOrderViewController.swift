//
//  ListOrderViewController.swift
//  BigBurger
//
//  Created by walid nakbi on 23/7/2021.
//

import UIKit

class ListOrderViewController: UIViewController {
var totalPriceOrder = String()
    let totlaLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = CommonConstant.blackColor
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        
        return lbl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       print(totalPriceOrder)
        // Do any additional setup after loading the view.
        setUpNavigation()
        view.addSubview(totlaLabel)
        constraintInit()
        totlaLabel.text = totalPriceOrder + "€"
    }
    
    func setUpNavigation() {
        navigationItem.title = "Total prix"
        navigationController?.navigationBar.barTintColor = CommonConstant.PrimaryColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: CommonConstant.blackColor]
        navigationItem.hidesSearchBarWhenScrolling = false
        view.backgroundColor = .white
        
       
    }
    func constraintInit(){
        totlaLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        totlaLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
