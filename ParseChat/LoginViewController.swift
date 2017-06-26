//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Isabella Teng on 6/26/17.
//  Copyright © 2017 Isabella Teng. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPress(_ sender: Any) {
        
        let username = userTextField.text ?? ""
        let password = passTextField.text ?? ""
        
        emptyCheck(user: username, pass: password)
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User login failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully!")
               //segue to login screen
            }
            
        }
        
    }
    
    func emptyCheck(user: String, pass: String) {
        if user.isEmpty || pass.isEmpty {
            let alertController = UIAlertController(title: "Empty Field", message: "Please enter your username and/or password", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                print("User dismissed error")
            })
            
            alertController.addAction(okAction)
            present(alertController, animated: true) {
            }
            
        }
    }

    @IBAction func signupPress(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = userTextField.text
        newUser.password = passTextField.text
        emptyCheck(user: newUser.username!, pass: newUser.password!)
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered Successfully!")
                // segue to logged in view
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
