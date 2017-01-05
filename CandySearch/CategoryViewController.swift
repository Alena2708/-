//
//  CategoryViewController.swift
//  CandySearch
//
//  Created by Admin on 21.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//


import UIKit


class CategoryViewController: UITableViewController  {

    var categoryes = [CategoryPlaces]()

    
    override func viewDidLoad() {
        
        categoryes = [
            CategoryPlaces(id:1, name:"Достопримечательности",idPhoto: UIImage(named: "Достопримечательности.png" )),
            CategoryPlaces(id:2, name:"Покупки",idPhoto:UIImage(named:"Покупки")),
            CategoryPlaces(id:3, name:"Рестораны",idPhoto:UIImage(named:"Рестораны.png")),
            CategoryPlaces(id:4, name:"Спорт",idPhoto:UIImage(named:"Спорт.png")),
            CategoryPlaces(id:5, name:"Отдых семьей",idPhoto:UIImage(named:"Отдых_семьей.png")),
            CategoryPlaces(id:6, name:"Ночные развлечения",idPhoto:UIImage(named:"Ночные_развлечения.png")),
            CategoryPlaces(id:7, name:"Здоровье",idPhoto:UIImage(named:"Здоровье.png")),
            CategoryPlaces(id:8, name:"Жилье",idPhoto:UIImage(named:"Жилье.png")),
            CategoryPlaces(id:9, name:"Транспорт",idPhoto:UIImage(named:"Транспорт.png")),
        ]
    }
    override func numberOfSections( in tableView: UITableView) ->Int {
    return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil) as! TableViewCell1
       // cell.photo.image = categoryes[indexPath.row].idPhoto
        cell.nameCategory.text = categoryes[indexPath.row].name
        return cell
    }
 override   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {return 65    }
}
  
