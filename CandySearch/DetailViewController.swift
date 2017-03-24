

import UIKit
import MapKit
class DetailViewController: UIViewController {
  

    @IBOutlet var detailDescriptionLabel: UILabel!

    @IBOutlet weak var candyImageView: UIImageView!

       
    @IBOutlet var CityText: UITextView!
    
//    @IBOutlet var CityText: UILabel!
   
    
    @IBOutlet var OnlineMap: UIButton!
   
 
    var detailCity: City? {
    didSet {
      configureView()
    }
  }
  
  func configureView() {
    if let detailCity = detailCity {
        if  (detailDescriptionLabel) != nil{
        candyImageView.image = UIImage(named: detailCity.name+".jpg")
        title = detailCity.name
        CityText.text=detailCity.text
        }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
 
    configureView()
    
  }
 
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
        if segue.identifier == "showPhoto"{
            let destinationViewController = segue.destination as!  PhotoGaleryView
            destinationViewController.detailCity = detailCity
            
        }
        if segue.identifier == "showCategory"{
             let destinationViewController = segue.destination as! CategoryViewController
          //  let destinationViewController = segue.destination as!  CategoryViewController
            destinationViewController.detailCity = detailCity
            
        }

    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        prefersStatusBarHidden
    }

}

    


