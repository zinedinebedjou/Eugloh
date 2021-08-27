//
//  EventsViewController.swift
//  ProjetEugloh
//
//  Created by Zinedine Bedjou on 23/05/2021.
//

import UIKit
import Firebase

class EventsViewController: UIViewController {
    
    
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
    
    
    func setUpElements(){
    Utilities.styleFilledButton(Part1)
    Utilities.styleHollowButton(Part2)
    Utilities.styleFilledButton(Part3)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func Event1(_ sender: Any) {
        let db = Firestore.firestore()
        
        let userID = Auth.auth().currentUser?.uid
        db.collection("Events").addDocument(data: ["Event":"Event1", "pseudo":userID as Any])
        
    }
    
    
    @IBAction func Event2(_ sender: Any) {
        let db = Firestore.firestore()
        
        let userID = Auth.auth().currentUser?.uid
        db.collection("Events").addDocument(data: ["Event":"Event2", "pseudo":userID as Any])
    }
    
    
    @IBAction func Event3(_ sender: Any) {
        let db = Firestore.firestore()
        
        let userID = Auth.auth().currentUser?.uid
        db.collection("Events").addDocument(data: ["Event":"Event3", "pseudo":userID as Any])
    }
    
    
}
