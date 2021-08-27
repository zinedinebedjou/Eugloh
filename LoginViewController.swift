//
//  LoginViewController.swift
//  ProjetEugloh
//
//  Created by Zinedine Bedjou on 18/05/2021.
//

import UIKit
import FirebaseAuth
import Firebase


struct ModelUser: Identifiable {
    var id: String = UUID().uuidString
    var email: String
    var password: String
}


class LoginViewController: UIViewController {
    
    var user = [Any]()
    
    @IBOutlet weak var AdMail: UILabel!
    
    @IBOutlet weak var AdMailB: UITextField!
    
    @IBOutlet weak var MPLabel: UILabel!
    
    @IBOutlet weak var MPButton: UITextField!
    
    @IBOutlet weak var SeConnecter: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
            
            ErrorLabel.alpha = 0
            
            Utilities.styleTextField((AdMailB))
            Utilities.styleTextField(MPButton)
            Utilities.styleFilledButton(SeConnecter)
        }
    
    @IBAction func SeconnecterAppui(_ sender: Any) {
    
        let emailEnter = AdMailB.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordEnter = MPButton.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        let db = Firestore.firestore()
        
        db.collection("Users").whereField("status", isEqualTo: "professeur").getDocuments { (querySnapshot, error) in
            if querySnapshot != nil && error == nil{
            let documents = querySnapshot!.documents
            for document in documents {
                self.user = documents.map{(queryDocumentSnapshot) -> ModelUser in
                    let data = queryDocumentSnapshot.data()
                    let email = data["email"] as? String ?? ""
                    let password = data["password"] as? String ?? ""
                    if email == emailEnter && password == passwordEnter{
                        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                            if error != nil {
                                // Couldn't sign in
                                self.ErrorLabel.text = error!.localizedDescription
                                self.ErrorLabel.alpha = 1
                            }
                            else {
                                let homeProfViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeProfViewController) as? HomeProfViewController

                                self.view.window?.rootViewController = homeProfViewController
                                self.view.window?.makeKeyAndVisible()
                            }
                    
                    }
                    
                    }
                return ModelUser(email: emailEnter, password: passwordEnter)
            }
        }
            
        db.collection("Users").whereField("status", isEqualTo: "etudiant").getDocuments { (querySnapshot, error) in
            if querySnapshot != nil && error == nil{
            let documents = querySnapshot!.documents
            for document in documents {
                self.user = documents.map{(queryDocumentSnapshot) -> ModelUser in
                    let data = queryDocumentSnapshot.data()
                    let email = data["email"] as? String ?? ""
                    let password = data["password"] as? String ?? ""
                    if email == emailEnter && password == passwordEnter{
                        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                            if error != nil {
                            // Couldn't sign in
                                self.ErrorLabel.text = error!.localizedDescription
                                self.ErrorLabel.alpha = 1
                                }
                                else {
                                    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? AuthentViewController

                                        self.view.window?.rootViewController = homeViewController
                                        self.view.window?.makeKeyAndVisible()
                                         }
                        
                                }
                        
                    }
                    return ModelUser(email: emailEnter, password: passwordEnter)
                    }
                }
            }
                
                
            db.collection("Users").whereField("status", isEqualTo: "responsable").getDocuments { (querySnapshot, error) in
                if querySnapshot != nil && error == nil{
                let documents = querySnapshot!.documents
                for document in documents {
                self.user = documents.map{(queryDocumentSnapshot) -> ModelUser in
                    let data = queryDocumentSnapshot.data()
                    let email = data["email"] as? String ?? ""
                    let password = data["password"] as? String ?? ""
                    if email == emailEnter && password == passwordEnter{
                        Auth.auth().signIn(withEmail: email, password:password) { (result, error) in
                            if error != nil {
                            // Couldn't sign in
                            self.ErrorLabel.text = error!.localizedDescription
                            self.ErrorLabel.alpha = 1
                            }
                            else {
                                let homeRespViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeRespViewController) as? HomeRespViewController
                                    self.view.window?.rootViewController = homeRespViewController
                                    self.view.window?.makeKeyAndVisible()
                                    }
                            
                            }
                            
                    }
                    
                    return ModelUser(email: emailEnter, password: passwordEnter)
                    }
                    }
                    }
                }
            }
        }
    }
    }
}
