//
//  DetailViewController.swift
//  Yelp
//
//  Created by Anish Adhikari on 2/18/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

   
    @IBOutlet weak var resturantImageView: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var numberReviewLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    var data: Business!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        titleLabel.text = data.name!
        
        resturantImageView.setImageWith(data.imageURL!)
        resturantImageView.layer.cornerRadius = 10
        resturantImageView.clipsToBounds = true
        
        categoryLabel.text = data.categories!
        addressLabel.text = data.address!
        numberReviewLabel.text = "\(data.reviewCount!) Reviews"
        ratingImageView.setImageWith(data.ratingImageURL!)
        distanceLabel.text = data.distance!
        //priceLabel.text = data.price!
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
