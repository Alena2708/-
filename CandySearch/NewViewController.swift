//
//  NewViewController.swift
//  CandySearch
//
//  Created by Admin on 24.01.17.
//  Copyright © 2017 Peartree Developers. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet private weak var imageViewPreview: UIImageView!
    @IBOutlet var currentPhoto: UIImage!
    //@IBOutlet var imageOne: UIImageView!

    @IBOutlet var imageAdress: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     func viewWollAppear(animated : Bool)
    {
        super.viewWillAppear(animated)
        self.imageViewPreview.image = currentPhoto
        
    }

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
