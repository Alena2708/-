//
//  NewViewController.swift
//  CandySearch
//
//  Created by Admin on 24.01.17.
//  Copyright © 2017 Peartree Developers. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet  var imageViewPreview: UIImageView!
    
   /* var NamePhoto = String()
    var ImageText = String()
    var corX = Float()
    var vorY = Float()*/
   // var detailPhoto: PhotoImage!
    @IBOutlet var currenText: UILabel!
    
    @IBOutlet var detailDescriptionLabel: UILabel!
    
    var detailPhoto: PhIm? {
        didSet {
            configureView()
        }
    }
    func configureView() {
        if let detailPhoto = detailPhoto {
            if  (detailDescriptionLabel) != nil{
               let data = NSData(contentsOf: URL(string:(detailPhoto.imagePhIm))!)
                imageViewPreview.image = UIImage(data: data as! Data)
                currenText.text = detailPhoto.namPhIm
            
                
         //   imageViewPreview.image =
             //  currenText.text = detailPhoto.namPhIm
             //   let data = NSData(contentsOf: URL(string:(detailPhoto.imagePhIm))!)
            //    imageViewPreview.image = UIImage(data: data as! Data)
             
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     /*   if NamePhoto != nil {
            configureView()
        }*/
        
        // Do any additional setup after loading the view.
    }
   /*  func viewWollAppear(animated : Bool)
    {
        super.viewWillAppear(animated)
        self.imageViewPreview.image = currentPhoto
        self.currenText.text = textName
        
    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
