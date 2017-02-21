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
    
   // var detailPhoto: PhotoImage!
    @IBOutlet var currenText: UILabel!
    
    @IBOutlet var detailDescriptionLabel: UILabel!
    
    var detailPhoto: PhotoImage? {
        didSet {
            configureView()
        }
    }
    func configureView() {
        if let detailPhoto = detailPhoto {
            if  (detailDescriptionLabel) != nil{
                let data = NSData(contentsOf: URL(string:(detailPhoto.image)!)!)
                imageViewPreview.image = UIImage(data: data as! Data)
                currenText.text = detailPhoto.name
               // candyImageView.image = UIImage(named: detailCity.name+".jpg")
              //  title = detailCity.name
               // CityText.text=detailCity.text
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
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
