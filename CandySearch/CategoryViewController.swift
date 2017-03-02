//
//  CategoryViewController.swift
//  CandySearch
//
//  Created by Admin on 21.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//


import UIKit
/*struct CategoryPlaces {
    var id: Int!
    var name: String!
    var idPhoto: UIImage!
}

*/
class CategoryViewController: UIViewController  {
///var detailViewController: PlacesTableView? = nil
  //  var categoryes = [CategoryPlaces]()
var detailCity: City!
    
    override func viewDidLoad() {
    /*
        categoryes = [
            CategoryPlaces(id:1, name:"Достопримечательности",idPhoto: UIImage(named: "Достопримечательности" )),
            CategoryPlaces(id:2, name:"Покупки",idPhoto:UIImage(named:"Покупки")),
            CategoryPlaces(id:3, name:"Питание",idPhoto:UIImage(named:"Питание")),
            CategoryPlaces(id:4, name:"Спорт",idPhoto:UIImage(named:"Спорт")),
            CategoryPlaces(id:5, name:"Отдых семьей",idPhoto:UIImage(named:"Отдых_семьей")),
            CategoryPlaces(id:6, name:"Ночные развлечения",idPhoto:UIImage(named:"Ночные_развлечения")),
            CategoryPlaces(id:7, name:"Здоровье",idPhoto:UIImage(named:"Здоровье")),
            CategoryPlaces(id:8, name:"Жилье",idPhoto:UIImage(named:"Жилье")),
            CategoryPlaces(id:9, name:"Транспорт",idPhoto:UIImage(named:"Транспорт")),
        ]*/
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/*    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
  
       cell.photo.image = categoryes[indexPath.row].idPhoto
        cell.nameCatrgory.text = categoryes[indexPath.row].name
 
        return cell
    }
 override   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
    }
 
    */
    
    
/*    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlaces"{
            if let indexPath = tableView.indexPathForSelectedRow {
            let category : CategoryPlaces
              category = categoryes[(indexPath as NSIndexPath).row]
             let destinationViewController = segue.destination as!  PlacesTableView
            destinationViewController.detailCategory = category
              destinationViewController.detailCity = detailCity
            }}
    }

    */
}





  
