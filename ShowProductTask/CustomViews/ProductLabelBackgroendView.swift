//
//  ProductLabelBackgroendView.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import UIKit

class ProductTableBackgroundView:UIView{
    lazy var label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text  = "Product Page Is Empty!"
        label.font = .boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        addSubview(label)
        label.centerInSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
