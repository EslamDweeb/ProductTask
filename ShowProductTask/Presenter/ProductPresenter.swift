//
//  ProductPresenter.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import Foundation
import CoreData

protocol ProductPresenterDelegate:class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error:String)
}
protocol ProductCellDelegate {
    func dispalyImage(ImageUrl:String)
    func displayProductTitle(title:String)
}
class ProductVCPresenter{
    
    private weak var delegate: ProductPresenterDelegate?
    var productsArray: [Product] = []
   // private var dataBaseManager = ProductManger.shardInstants
    
    init(delegate:ProductPresenterDelegate) {
        self.delegate = delegate
    }
    
    func viewDidLoad(){
        getProducts()
    }
    
    func getProducts(){
        delegate?.showIndicator()
        NetworkClient.getProduct {[weak self] (result) in
            guard let self = self else{return}
            self.delegate?.hideIndicator()
            switch result {
            case.success(let data):
                self.productsArray = data.data.products
                self.delegate?.fetchingDataSuccess()
              //  self.dataBaseManager.saveToCoreData(products: data.data.products)

             //  self.fetchfromDataBase()
            case.failure(let error):
                self.delegate?.showError(error: error.localizedDescription)
                
            }
        }
    }
//    private func fetchfromDataBase(){
//        self.productsArray = self.dataBaseManager.changeToProductArray()
//        self.delegate?.fetchingDataSuccess()
//    }
    func getProductCount()-> Int{
        return productsArray.count
    }
    
    func configureTableCell(cell:ProductCellDelegate,index:Int){
        if productsArray.isEmpty{
            return
        }else{
            let product = productsArray[index]
            if  !product.links.isEmpty{
                cell.dispalyImage(ImageUrl: product.links[0].link)
            }
            cell.displayProductTitle(title:product.nameEn)
        }
    }
}
