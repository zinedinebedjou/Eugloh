//
//  ViewController.swift
//  ProjetEugloh
//
//  Created by Zinedine Bedjou on 18/05/2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var SeConnecter: UIButton!
    
    @IBOutlet weak var VisitAnonyme: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
       
    }
    
    func setUpElements(){
            Utilities.styleFilledButton(SeConnecter)
            Utilities.styleHollowButton(VisitAnonyme)
        }

}

