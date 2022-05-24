//
//  HomeViewController.swift
//  PenguininTask
//
//  Created by Yazeed Afaneh on 24/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var searchKey = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        
        if let searchKey = searchTextField.text {
            self.searchKey = searchKey
        }
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let searchVC = storyBoard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        searchVC.searchKey = self.searchKey
        self.navigationController?.pushViewController(searchVC, animated:true)
    }
}
