//
//  ProductsVC.swift
//  ShowProductTask
//
//  Created by eslam dweeb on 28/06/2021.
//

import UIKit
import SKActivityIndicatorView

class ProductsVC:UIViewController,ProductPresenterDelegate{
    
    //MARK:- UIView Componetnts
    lazy var pullControl: UIRefreshControl = {
        let pullControl = UIRefreshControl()
        pullControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
                pullControl.addTarget(self, action: #selector(refreshListData(_:)), for: .valueChanged)
        return pullControl
    }()
    lazy var tableView:UITableView = {
        let table = UITableView()
        table.register(ProductCell.self, forCellReuseIdentifier: ProductCell.getIdentifier())
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        if #available(iOS 10.0, *) {
            table.refreshControl = pullControl
        } else {
            table.addSubview(pullControl)
        }
        return table
    }()
    
    // Actions
    @objc private func refreshListData(_ sender: Any) {
        presenter.getProducts()
        }
    //MARK:- Variables
    lazy var presenter = ProductVCPresenter(delegate: self)
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    //MARK:- Setup View Functions
    
    private func setupView(){
        configView()
        addSubViews()
        addConstraintsToUI()
    }
    private func configView(){
        title = "Products"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        self.view.layoutIfNeeded()
        
    }
    private func addSubViews(){
        view.addSubview(tableView)
    }
    private func addConstraintsToUI(){
        tableView.fillSuperview()
    }
    //MARK:- Presenter Delegate Functions
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        self.pullControl.endRefreshing()
        SKActivityIndicator.dismiss()
    }
    
    func fetchingDataSuccess() {
        //    self.tableView.reloadWithAnimation()\
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
}

extension ProductsVC:UITableViewDelegate,UITableViewDataSource{
    func handelTabelBackgroundView(){
        if presenter.getProductCount() > 0 {
            tableView.backgroundView = nil
        }else{
            let backGroundView = ProductTableBackgroundView(frame: tableView.frame)
            tableView.backgroundView = backGroundView
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        handelTabelBackgroundView()
        return presenter.getProductCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.getIdentifier()) as! ProductCell
        presenter.configureTableCell(cell: cell, index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        createAlertController()
    }
    func createAlertController(){
        let alert = UIAlertController(title: "Cell Tapped", message: "You tapped the cell", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true)
    }
}

