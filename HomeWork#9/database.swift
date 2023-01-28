//
//  database.swift
//  HomeWork#9
//
//  Created by Бекжан on 28.01.2023.
//

import Foundation

struct Database {
    static let productsList:[Products] = [
    Products(title: "Часы", price: 52000, image: "watches"),
    Products(title: "Телефон", price: 100000, image: "phone"),
    Products(title: "Ноутбук", price: 200000, image: "laptop"),
    Products(title: "Телевизоp", price: 100000, image: "tv")
    ]
    
}

struct Products{
    let title:String
    let price:Int
    let image:String
}

