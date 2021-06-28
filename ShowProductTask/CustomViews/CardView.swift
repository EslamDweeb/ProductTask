//
//  CardView.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import UIKit

class CardView:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        backgroundColor = .white
        layer.cornerRadius = 5
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setShadow(shadowColor: UIColor.black.cgColor, shadowOffset: .zero, shadowOpacity: 0.3, shadowRaduis: 5)
    }
}
