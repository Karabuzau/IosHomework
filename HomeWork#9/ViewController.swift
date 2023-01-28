//
//  ViewController.swift
//  HomeWork#9
//
//  Created by Бекжан on 28.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var  productsTableView:UITableView = {
        let tableView = UITableView()
        tableView.register(ProductUITableViewCell.self, forCellReuseIdentifier:ProductUITableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
          
        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        productsTableView.dataSource = self
        productsTableView.delegate = self
        view.backgroundColor = .systemBackground
    }


}


extension UIViewController:UITableViewDataSource, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Database.productsList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductUITableViewCell.identifier, for: indexPath) as! ProductUITableViewCell
        cell.configure(with: Database.productsList[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.size.height * 0.55
    }
    
    
    
}

private extension ViewController{
    func setupViews(){
        view.addSubview(productsTableView)
        
    }
    func setupConstraints(){
        productsTableView.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.trailing.leading.equalToSuperview().inset(15)
        }
    }
}
