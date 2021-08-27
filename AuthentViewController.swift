//
//  AuthentViewController.swift
//  ProjetEugloh
//
//  Created by Zinedine Bedjou on 18/05/2021.
//

import UIKit
import MessageUI
import Firebase

class AuthentViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var bienvenu: UITextView!
    
    @IBOutlet weak var Events: UIButton!
    
    @IBOutlet weak var Modules: UIButton!
    
    @IBOutlet weak var News: UIButton!
    
    @IBOutlet weak var SendMail: UIButton!
    
    @IBOutlet weak var TimeTable: UIButton!
    
    @IBOutlet weak var LogOFF: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
            
        Utilities.styleFilledButton(Events)
        Utilities.styleFilledButton(Modules)
        Utilities.styleFilledButton(News)
        Utilities.styleFilledButton(SendMail)
        Utilities.styleFilledButton(TimeTable)
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
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        switch result {
        case .sent:
            print("sent")
        case .saved:
            print("saved")
        case .failed:
            print("failed")
        case .cancelled:
            print("cancelled")
        default:
            break
        }
    }
    
    
    func resultAlert(title: String, message : String, titleForAction : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: titleForAction, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    private func sendMail(){
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["mail@cloud.com"])
        mailComposerVC.setSubject("Subject")
        mailComposerVC.setMessageBody("message body", isHTML: false)
        self.present(mailComposerVC, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func SendMailAction(_ sender: Any) {
        if !MFMailComposeViewController.canSendMail(){
            let alert = UIAlertController(title: "Error", message: "mail services are not available", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        self.sendMail()
    }
    
    
    
    @IBAction func LogOFFTapped(_ sender: Any) {
        let homeView = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeView) as? ViewController

        self.view.window?.rootViewController = homeView
        self.view.window?.makeKeyAndVisible()
    }
    
    
    
}
