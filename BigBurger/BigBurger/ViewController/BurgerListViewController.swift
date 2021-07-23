//
//  BurgerListViewController.swift
//  BigBurger
//
//  Created by walid nakbi on 22/7/2021.
//

import UIKit

class BurgerListViewController: BaseViewController {
    let tableView : UITableView = {
           let t = UITableView()
           t.translatesAutoresizingMaskIntoConstraints = false
           return t
       }()
    var listBurgerOrder = [BurgerElement]()
    var ViewModelBurger = BurgerViewModel()
    var price = Float()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupTableView()
        configConstriant()
        setUpNavigation()
      
        closureSetup()
        getAnnoncesList()
        
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
        let submitItem  = UIBarButtonItem(title: "Ma commande", style: .plain, target: self, action: #selector(SubmitButtonTouched))
        submitItem.tintColor = .black
        submitItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 14)!], for: .normal)
        self.navigationItem.rightBarButtonItem = submitItem
       
    }
    @objc func SubmitButtonTouched(){
        let vc = ListOrderViewController()
        vc.totalPriceOrder = String(format: "%.2f", price)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(BurgerTableViewCell.self, forCellReuseIdentifier: "cell")
    }
 func tableViewReload() {
        removeActivityIndicator()
        tableView.reloadData()
    }
    func closureSetup() {
        // add error handling
        ViewModelBurger.onErrorHandling = { [weak self] error in
            DispatchQueue.main.async {
                self?.removeActivityIndicator()
                switch error {
                case .custom(let message):
                    self?.displayAlert(message: message)
                    break
                default:
                    self?.displayAlert(message: error?.localizedDescription ?? "Error")
                    break
                }
            }
            }
        
        //refresh screen
        ViewModelBurger.onRefreshHandling = { [weak self] in
            DispatchQueue.main.async {
                self?.tableViewReload()
            }
        }
    }
  func getAnnoncesList(){
        self.displayActivityIndicator(onView: self.view)
    
        ViewModelBurger.getlistBurger()
}
}
extension BurgerListViewController : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModelBurger.numberOfBurger()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! BurgerTableViewCell
        let burger = ViewModelBurger.BurgerIndex(at: indexPath.row)
        cell.index = indexPath
        cell.delegate = self
        cell.Burger = burger
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}
extension BurgerListViewController : BurgerCell {
    func addOrder(index: Int) {
       
        let burgerOrder = ViewModelBurger.BurgerIndex(at: index)
        price = price + round( burgerOrder!.price) / 100
     
        print(String(format: "%.2f", price) )
        
    }
    
    
}
