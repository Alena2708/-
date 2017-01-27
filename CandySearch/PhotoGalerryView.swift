//
//  PhotoGalerryView.swift
//  CandySearch
//
//  Created by Admin on 16.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//

import UIKit
struct Photos{
   
    var url: String!        //URL!
    var nameAdr: String!
    var placesId: Int!
}

class PhotoGaleryView: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var photos = [Photos]()
    var detailCity: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photos = [
            Photos(url: "https://github.com/Alena2708/Photo/blob/master/Абзаково/Абзаково_отель_Эдельвейс.jpg" , nameAdr: "Горный проезд 1A, Абзаково, Россия" , placesId: 1)
         /*  , Photos(url: URL(string:"https://github.com/Alena2708/Photo/blob/master/Абзаково/Абзаково_дом_отдыха_Снежный_барс.jpg") , nameAdr:"Трасса Р316 Магнитогорск-Белорецк. поворот на санаторий Орленок между ж.д. станцией Новоабзаково и деревней Староабзаково. Коттедж сразу за санаторием Орленок." ,placesId: 1),
            Photos(url: URL(string:"https://github.com/Alena2708/Photo/blob/master/Абзаково/Абзаково_отель_Межгорье.jpg") , nameAdr:"Россия, Республика башкортостан, р-н Белорецкий, с. Ново-Абзаково, ул.Кизильская, 32" ,placesId: 1),
            Photos(url: URL(string:"https://github.com/Alena2708/Photo/blob/master/Абзаково/Абзаково_отель_актив_горки.jpg") , nameAdr:"Улица Горнолыжная 35, Новоабзаково, Россия" ,placesId: 1),
            Photos(url: URL(string:"https://github.com/Alena2708/Photo/blob/master/Абзаково/Абзаково_зоопарк.jpg") , nameAdr:"с. Новоабзаково, Горнолыжная, 101/5" ,placesId: 1)
       */ /*   , Photos(url: URL(string:"") , nameAdr:"" ,placesId: 1),
            Photos(url: URL(string:"") , nameAdr:"" ,placesId: 1),
            Photos(url: URL(string:"") , nameAdr:"" ,placesId: 1),*/
        ]
        
    
        
        }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         // Нам нужна лишь одна секция
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Количество ячеек должно соответствовать количеству
        // фотографий в нашем массиве
        return self.photos.count
    }
    
    func loadImage(urlString:String)
    {
        
        var imgURL: URL = URL(string: urlString)!
        let request: URLRequest = URLRequest(url: imgURL)
        NSURLConnection.sendAsynchronousRequest(
            request, queue: OperationQueue.mainQueue(),
            completionHandler: {(response: URLResponse!,data: NSData!,error: NSError!) -> Void in
                if error == nil {
                    self.image_element.image = UIImage(data: data)
                }
        })

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPhoto", for: indexPath) as! CollectionViewCellPhotos
        //обработка города  и в зависимости отображаем картинки из массива 
        let  imageview : UIImage!
        if detailCity.id == self.photos.placesId{
            imageview = loadImage(urlString: self.photos.url)
            cell.photo.image = imageview
        }
      
        
        
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView , didSelectItemAt: IndexPath){
        
        self.performSegue(withIdentifier: "showOneImage", sender: self)
        
    }

    
    override    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showOneImage"{
            let cell : CollectionViewCellPhotos = sender as! CollectionViewCellPhotos
            
            let image = cell.photo.image
            let previewVC : NewViewController = segue.destination as! NewViewController
            previewVC.currentPhoto = image 
       /* let idexPaths =  self.collectionView.indexPathsForSelectedItems! // self.collectionView.idexPathsForSelectedItems()!
            let idexPath = idexPaths[0] //as NSIdexPath
            
            let vs = segue.destination as! NewViewController
            let dataImage = NSData(contentsOf: photos[idexPath.row].url)
           
             //   vs.imageOne.image  = UIImage(data:dataImage as! Data)
            
          //  vs.imageOne = self.photos[idexPath.row].url
            vs.imageAdress.text = self.photos[idexPath.row].nameAdr
           // vs.title = self.detailCity[indexPath].row */
        }
    }
        
 
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
