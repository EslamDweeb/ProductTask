//
//  ProductManger.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import UIKit
import CoreData

class ProductManger{
    
    static let shardInstants = ProductManger()
    private init(){
        
    }
    func saveToCoreData(products:[Product]){
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let entity =
            NSEntityDescription.entity(forEntityName: "LocalProduct",
                                       in: managedContext)!
        
        
        // 3
        for product in products {
            let localProducts = NSManagedObject(entity: entity,
                                                insertInto: managedContext)
            localProducts.setValue(product.nameEn, forKeyPath: "name")
            if !product.links.isEmpty{
                localProducts.setValue(product.links[0].link, forKey: "imageUrl")
            }
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        
    }
    func fetchProducts() -> [NSManagedObject]{
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "LocalProduct")
        
        //3
        do {
            return try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    func changeToProductArray()->[Product]{
        let arr = fetchProducts()
        var newArr = [Product]()
        for pro in arr {
            if pro.value(forKeyPath: "imageUrl") != nil {
                newArr.append(Product(nameEn: pro.value(forKeyPath: "name") as! String, links: [Link(link: pro.value(forKeyPath: "imageUrl")as!String)]))
            }else{
                newArr.append(Product(nameEn: pro.value(forKeyPath: "name") as! String, links: [Link(link:"")]))
            }
        }
        return newArr
        
    }
}
