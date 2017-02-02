//
//  PhotoGalerryView.swift
//  CandySearch
//
//  Created by Admin on 16.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//

import UIKit

class PhotoGaleryView: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate{
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var detailDescriptionLabel: UILabel!
    
    
    var itemsAry:[Item]?
    var cache = NSCache<AnyObject, AnyObject>()
    var detailCity: City!
  
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let item = Item(cityId: 0, img: "",coordx:0,coordy:0,name:"")
        itemsAry = item.makeItems()
    //collectionView.reloadData()
        }
   
       // смотрим сколько ячеек необходимо создать
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Количество ячеек должно соответствовать количеству
        // фотографий в нашем массиве
       return (itemsAry?.count)!
        
    }
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
//заполняем ячейки
   
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPhoto", for: indexPath) as! CollectionViewCellPhotos
     
        let item = itemsAry?[indexPath.row]
        if  item?.citynameStr == self.detailCity?.id
        {
        cell.nameLabel.text = item?.name
        
        if let img = cache.object(forKey: item?.name as AnyObject) {
            cell.photo.image = img as! UIImage
        }else {
            DispatchQueue.global().async {
                let data = NSData(contentsOf: URL(string:(item?.imageStr)!)!)
                DispatchQueue.main.async {
                    cell.photo.image = UIImage(data: data as! Data)
                    self.cache.setObject(UIImage(data: data as! Data)!, forKey: item?.name as AnyObject)
                }
            }
        }

        }
        
   /*     let item = itemsAry?[indexPath.row]
      
       if  item?.citynameStr == self.detailCity?.id
       {
        let data = NSData(contentsOf: URL(string:(item?.imageStr)!)!)
        cell.photo.image = UIImage(data: data as! Data)
         cell.nameLabel.text = item?.name
       }
       else {}*/
        return cell
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        prefersStatusBarHidden
    }

    func collectionView(_ collectionView: UICollectionView , didSelectItemAt: IndexPath){
        
        self.performSegue(withIdentifier: "showOnePhoto", sender: self)
        
    }

    //передача данных дочернему окну с  фотографией
       override    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showOnePhoto"{
           let cell : CollectionViewCellPhotos = sender as! CollectionViewCellPhotos
            
            let image = cell.photo.image
            let text = cell.nameLabel.text
            let previewVC : NewViewController = segue.destination as! NewViewController
            previewVC.currentPhoto = image
            previewVC.textName = text
            }
    }
    
 

    
    
    }
