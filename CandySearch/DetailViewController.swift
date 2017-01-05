

import UIKit

class DetailViewController: UIViewController {
  
    // content mode list
  //  var contentModeList: [String]!
    
    // current content mode index
  //  var contentModeIndex : Int!
    
    
    // image list
  //  var imageList: [String]!
    
    // current image index
 //   var imageIndex: Int!
    
 // @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet var detailDescriptionLabel: UILabel!

    @IBOutlet weak var candyImageView: UIImageView!

    @IBOutlet var CityText: UITextView!
    
    @IBOutlet var OnlineMap: UIButton!
    //@IBOutlet var contentModeLabel: UILabel!
 //   @IBOutlet var pageContol: UIPageControl!
    
   // var timer : Timer!
  //  var updateCounter : Int!
    
 /*
    @IBOutlet var previousButtoon: UIBarButtonItem!
    @IBAction func previousButtonAction(_ sender: UIBarButtonItem) {
        
        // set prev content mode in the list
        if self.contentModeIndex >= 0 {
            self.contentModeIndex = self.contentModeIndex - 1
        }
        
        // set image content mode
        self.setImageContentMode()
    }
    
    @IBOutlet var nextButton: UIBarButtonItem!
    @IBAction func nextButtonAction(_ sender: UIBarButtonItem) {
        
        // set next content mode in the list
        if self.contentModeIndex < self.contentModeList.count {
            self.contentModeIndex = self.contentModeIndex + 1
        }
        
        // set image content mode
        self.setImageContentMode()
    }
*/
    
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
    
 //  updateCounter = 0
 //   timer = Timer.init(timeInterval: 1.0, target: self, selector: #selector (DetailViewController.updateTimer), userInfo: nil, repeats: true)
    
/*  self.imageList = ["Абзакво-1", "Абзакво-2","Абзакво-3"]
    // initialise content mode list
    self.contentModeList = [
        "ScaleToFill",
        "ScaleAspectFit",
        "ScaleAspectFill"
        
    ]
*/
    
    configureView()
  }
 /*internal func updateTimer()
    {
        if(updateCounter <= 2)
        {
        pageContol.currentPage = updateCounter
            candyImageView.image = UIImage(named: String (updateCounter+1)+".png")
            updateCounter = updateCounter+1
        }
        else{
            updateCounter = 0
        }
    }
*/
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showMap"{
        let destinationViewController = segue.destination as!  MapViewController
        destinationViewController.detailCity = detailCity
        
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        prefersStatusBarHidden
    }
    
       /* fileprivate func setImage(){
        self.candyImageView.image = UIImage(named: self.imageList[self.imageIndex])
  //  }

    // set imageView content mode
    fileprivate func setImageContentMode(){
        
        // set content mode
            self.candyImageView.contentMode = UIViewContentMode.init(rawValue: self.contentModeIndex)!
        //2 stroci
     //   self.imageIndex = self.contentModeIndex
     //  self.setImage()
    
        // set label for current content mode
        self.contentModeLabel.text = self.contentModeList[self.contentModeIndex]
        
        // enable/disable prev next button
        self.setButton()
    }
    
    // enable/disable prev next button
    fileprivate func setButton(){
        
        if self.contentModeIndex == 0 {
            self.previousButtoon.isEnabled = false
            self.nextButton.isEnabled = true
        }else if ( self.contentModeIndex == self.contentModeList.count - 1 ) {
            self.previousButtoon.isEnabled = true
            self.nextButton.isEnabled = false
        }else{
            self.previousButtoon.isEnabled = true
            self.nextButton.isEnabled = true
        }*/
        
    }

    
//}

