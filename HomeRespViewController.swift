//
//  HomeRespViewController.swift
//  ProjetEugloh
//
//  Created by Zinedine Bedjou on 23/05/2021.
//

import UIKit

class HomeRespViewController: UIViewController {
    
    
    @IBOutlet weak var Students: UIButton!
    
    @IBOutlet weak var Professors: UIButton!
    
    @IBOutlet weak var SendMail: UIButton!
    
    @IBOutlet weak var LogOFF: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
            
        Utilities.styleFilledButton(Students)
        Utilities.styleFilledButton(Professors)
        Utilities.styleFilledButton(SendMail)
        Utilities.styleHollowButton(LogOFF)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func LogOFFTapped(_ sender: Any) {
        let homeView = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeView) as? ViewController

        self.view.window?.rootViewController = homeView
        self.view.window?.makeKeyAndVisible()
    }

}
