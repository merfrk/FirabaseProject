//
//  ViewController.swift
//  PhotoSharingApp
//
//  Created by Omer on 25.05.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sigInClicked(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != ""{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authDataResult, error in
                if error != nil{
                    self.showErrorMessage(titleInput: "Error", messageInput: error?.localizedDescription ?? "Wrong username or password. Please try again!")
                } else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else{
            if emailTextField.text == ""{
                showErrorMessage(titleInput: "Error!", messageInput: "Please Enter Username")
            }
            showErrorMessage(titleInput: "Error!", messageInput: "Please Enter Password")
        }
    }
    
    func showErrorMessage(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
}

