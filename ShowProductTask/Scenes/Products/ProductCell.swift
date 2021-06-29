//
//  ProductCell.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import UIKit
import SDWebImage
class ProductCell:UITableViewCell{
    //MARK:- UI Components
    lazy var cardView = CardView()
    lazy var productImage:UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    lazy var titleLabel:UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    lazy var stackView = UIStackView(arrangedSubviews: [
        productImage,titleLabel
    ], customSpacing: 8)
    
    //MARK:- Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        productImage.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Setup Functions
    private func setupCell(){
        selectionStyle = .none
        addSubviews()
        addConstraints()
    }
    private func addSubviews(){
        addSubview(cardView)
        cardView.addSubview(stackView)
    }
    private func addConstraints(){
        cardView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        productImage.constrainWidth(constant: 100)
        productImage.constrainHeight(constant: 100)
        stackView.centerYInSuperview()
        stackView.anchor(top: nil, leading: cardView.leadingAnchor, bottom: nil, trailing: cardView.trailingAnchor,padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
}

extension ProductCell:ProductCellDelegate{
    func dispalyImage(ImageUrl: String) {
        //productImage.downloadImage(with: ImageUrl)
        productImage.sd_setImage(with: URL(string:ImageUrl), completed: nil)
    }
    
    func displayProductTitle(title: String) {
        titleLabel.text = title
    }
    
    
}
