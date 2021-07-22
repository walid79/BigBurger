//
//  BurgerTableViewCell.swift
//  BigBurger
//
//  Created by walid nakbi on 22/7/2021.
//

import UIKit

class BurgerTableViewCell: UITableViewCell {
    var BurgerViewModel : BurgerViewModel?
    var Burger : BurgerElement? {
        didSet {
            self.nameBurger.text = self.Burger?.title
            self.imageBurger.downloaded(from: Burger?.thumbnail ?? "")
            self.DescriptionBurger.text = self.Burger?.burgerDescription
            self.PriceBurger.text = String(round(Burger!.price) / 100) + "€"
        }
    }
    let newContentView : UIView = {
        let V = UIView()
        V.translatesAutoresizingMaskIntoConstraints = false
        //V.backgroundColor = .black
        return V
    }()
    let imageBurger : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "imageburger" )
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        return img
    }()
    private let nameBurger : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = CommonConstant.blackColor
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.text = "good burger"
        lbl.numberOfLines = 0
        return lbl
    }()
    private let PriceBurger : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = CommonConstant.blackColor
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.text = "25 EUR"
        lbl.numberOfLines = 0
        return lbl
    }()
    private let DescriptionBurger : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = CommonConstant.blackColor
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.text = "jkjkgjkgjkgjkjgkjkgjkggkjgjkgjkjg"
        lbl.numberOfLines = 0
        return lbl
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //contentView.backgroundColor = UIColor(red: 0.24, green: 0.24, blue: 0.27, alpha: 1.00)
        self.contentView.addSubview(newContentView)
        //addSubview(imageBurger)
        newContentView.addSubview(imageBurger)
        newContentView.addSubview(nameBurger)
        newContentView.addSubview(PriceBurger)
        newContentView.addSubview(DescriptionBurger)
        NSLayoutConstraint.activate([
                   newContentView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
                   newContentView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
                   newContentView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
                   newContentView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            imageBurger.topAnchor.constraint(equalTo: newContentView.topAnchor, constant: 10),
            
            imageBurger.leadingAnchor.constraint(equalTo:newContentView.leadingAnchor, constant: 10),
            imageBurger.trailingAnchor.constraint(equalTo: newContentView.trailingAnchor, constant: -10),
            imageBurger.heightAnchor.constraint(equalToConstant: 170),
            nameBurger.topAnchor.constraint(equalTo: imageBurger.bottomAnchor, constant: 8),
            nameBurger.leadingAnchor.constraint(equalTo:newContentView.leadingAnchor, constant: 10),
            nameBurger.trailingAnchor.constraint(equalTo: newContentView.trailingAnchor, constant: -10),
            PriceBurger.topAnchor.constraint(equalTo: imageBurger.bottomAnchor, constant: 8),
           
            PriceBurger.trailingAnchor.constraint(equalTo: newContentView.trailingAnchor, constant: -10),
            DescriptionBurger.topAnchor.constraint(equalTo: nameBurger.bottomAnchor, constant: 8),
            DescriptionBurger.leadingAnchor.constraint(equalTo:newContentView.leadingAnchor, constant: 10),
            DescriptionBurger.trailingAnchor.constraint(equalTo: newContentView.trailingAnchor, constant: -10),
           
            
                   ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
