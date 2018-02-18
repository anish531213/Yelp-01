//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var businesses: [Business]!
    var default_businesses: [Business]!
    
    let searchBar: UISearchBar = UISearchBar()
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        searchBar.sizeToFit()
        searchBar.placeholder = "e.g. resturants, thai"
        navigationItem.titleView = searchBar
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 85
        
        searchBusinessesWithTerm(text: "Thai")
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm("Restaurants", sort: .distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: Error!) -> Void in
         self.businesses = businesses
         
         for business in businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         */
        
    }
    
    func searchBusinessesWithTerm(text: String) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.hidesWhenStopped = true
        Business.searchWithTerm(term: text, completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.tableView.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            if text == "Thai" {
                self.default_businesses = businesses
            }
            self.searchBar.resignFirstResponder()
            self.myActivityIndicator.stopAnimating()
        }
            
        )
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        
        return cell
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        print("editiong")
        searchBar.becomeFirstResponder()
    }
    
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        //searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        businesses = default_businesses
        tableView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBusinessesWithTerm(text: searchBar.text!)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
