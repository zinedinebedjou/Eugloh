//
//  EventAuthViewController.swift
//  ProjetEugloh
//
//  Created by Zinedine Bedjou on 23/05/2021.
//

import UIKit
import Firebase

class EventAuthViewController: UIViewController {
    
    @IBOutlet weak var Event1: UILabel!
    
    @IBOutlet weak var Part1: UIButton!
    
    @IBOutlet weak var Event2: UILabel!
    
    @IBOutlet weak var Part2: UIButton!
    
    @IBOutlet weak var Event3: UILabel!
    
    @IBOutlet weak var Part3: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setUpElements(){
    Utilities.styleFilledButton(Part1)
    Utilities.styleHollowButton(Part2)
    Utilities.styleFilledButton(Part3)
    }
    
    
    @IBAction func Part1Tapped(_ sender: Any) {
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser?.email
        
        db.collection("Events").addDocument(data: ["Event":"Event1", "email":user as Any])
    }
    
    
    
    
    @IBAction func Part2Tapped(_ sender: Any) {
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser?.email
        
        db.collection("Events").addDocument(data: ["Event":"Event2", "email":user as Any])
    }
    
    
    
    @IBAction func Part3Tapped(_ sender: Any) {
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser?.email
        
        db.collection("Events").addDocument(data: ["Event":"Event3", "email":user as Any])
    }
    

}
