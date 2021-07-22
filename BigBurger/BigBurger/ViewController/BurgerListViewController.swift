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
        view.addSubview(tableView)
        setupTableView()
        configConstriant()
        setUpNavigation()
       
        // Do any additional setup after loading the view.
    }
    
    func configConstriant(){
        NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
                                        
      ])
        
    }
    func setUpNavigation() {
        navigationItem.title = "Burger"
        navigationController?.navigationBar.barTintColor = CommonConstant.PrimaryColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: CommonConstant.blackColor]
        navigationItem.hidesSearchBarWhenScrolling = false
        view.backgroundColor = .white
     
    }
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(BurgerTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
extension BurgerListViewController : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! BurgerTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}
