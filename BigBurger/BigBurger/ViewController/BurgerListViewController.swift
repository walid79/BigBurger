//
//  BurgerListViewController.swift
//  BigBurger
//
//  Created by walid nakbi on 22/7/2021.
//

import UIKit

class BurgerListViewController: UIViewController {
    let tableView : UITableView = {
           let t = UITableView()
           t.translatesAutoresizingMaskIntoConstraints = false
           return t
       }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configConstriant(){
        NSLayoutConstraint.activate([
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
        tableView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                                        
      ])
        
    }
}
