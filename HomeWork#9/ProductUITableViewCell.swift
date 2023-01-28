//
//  ProductUITableViewCell.swift
//  HomeWork#9
//
//  Created by Бекжан on 28.01.2023.
//

import UIKit

class ProductUITableViewCell: UITableViewCell {
    
    static let identifier = "ProductUITableViewCell"
    
    private let textView = UIView()
    
    
    private lazy var productTitleLable:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .label
        
        return label
        
    }()
    
    private lazy var productPriceLable:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGreen
        
        return label
        
    }()
    
    private lazy var productImageview:UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
        
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupContsraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product:Products){
        productTitleLable.text = product.title
        productPriceLable.text = "\(product.price) Тенге"
        productImageview.image = UIImage(named: product.image)
        
    }
    
}


private extension ProductUITableViewCell{
    func setupViews(){
        contentView.addSubview(textView)
        textView.addSubview(productTitleLable)
        textView.addSubview(productPriceLable)
        contentView.addSubview(productImageview)
        
    }
    
    func setupContsraints(){
        
        textView.snp.makeConstraints{make in
            make.top.leading.bottom.equalToSuperview().inset(15)
//            make.width.equalToSuperview()
        }
        
        productImageview.snp.makeConstraints{make in
            make.top.trailing.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(textView.snp.trailing)
            make.size.equalTo(100)
        }
        
        productPriceLable.snp.makeConstraints{make in
            make.top.equalTo(productTitleLable.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        productTitleLable.snp.makeConstraints{make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.75)

            
        }
        
    }
}
