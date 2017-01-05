//
//  PhotoGalerryView.swift
//  CandySearch
//
//  Created by Admin on 16.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//

import UIKit


class PhotoGaleryView: UIViewController {
    @IBOutlet var mainScrollView: UIScrollView!
    
var Абзаково = [UIImage]()
   var Адлер = [UIImage]()
    var detailCity: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    /*    mainScrollView.frame = view.frame
        self.Абзаково = [UIImage(named:"Абзаково-1.jpg")!,UIImage(named:"Абзаково-2.jpg")!,UIImage(named:"Абзаково-3.jpg")!,UIImage(named:"Абзаково-4")!,UIImage(named:"Абзаково-5.jpg")!,UIImage(named:"Абзаково-6.jpg")!,UIImage(named:"Абзаково-7.jpg")!,UIImage(named:"Абзаково-8.jpg")!,UIImage(named:"Абзаково-9.jpg")!,UIImage(named:"Абзаково-10.jpg")!]
        
        self.Адлер = [UIImage(named:"Адлер-1.jpg")!,UIImage(named:"Адлер-2.jpg")!,UIImage(named:"Адлер-3.jpg")!]
       
        if detailCity.name  == "Абзаково"{
            
            for i in 0..<9{
                
                let imageView = UIImageView()
                imageView.image = Абзаково[i]
                let xPosition = Int(self.view.frame.width) *  i
               imageView.frame = CGRect(x: CGFloat(xPosition), y: 0, width: CGFloat(self.mainScrollView.frame.width), height: (self.mainScrollView.frame.height))
              //  imageView.frame = CGRect (x: xPosition ,y: 0,width: CGFloat(self.mainScrollView.frame.width),height:CGFloat(self.mainScrollView.frame.height))
                mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat( i+1)
                self.mainScrollView.addSubview(imageView)
                
            }
            */
        }
        
 
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
