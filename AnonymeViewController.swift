//
//  AnonymeViewController.swift
//  ProjetEugloh
//
//  Created by Zinedine Bedjou on 18/05/2021.
//

import UIKit

class AnonymeViewController: UIViewController {
    
    
    @IBOutlet weak var Bienvenu: UILabel!
    
    
    @IBOutlet weak var Evenement: UIButton!
    
    
    @IBOutlet weak var News: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
    Utilities.styleFilledButton(Evenement)
    Utilities.styleFilledButton(News)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
