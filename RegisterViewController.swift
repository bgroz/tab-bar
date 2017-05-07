//
//  RegisterViewController.swift
//  tab bar
//
//  Created by Bartuğ Maden on 03/05/2017.
//  Copyright © 2017 Buğra Öz. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var txtmember: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtconfirmPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btncreateAccount(_ sender: UIButton) {
        
        if txtmember.text == "" || txtpassword.text == "" || txtconfirmPassword.text == ""  {
            let alert = UIAlertController(title: "Message", message: "Please fill the blanks", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert,animated: true, completion: nil)

            
        }
      
        createUserInFirebase()
        print("OK!")
        
    }
    func createUserInFirebase(){
        guard let member = txtmember.text, let password = txtpassword.text
            , let confirmPassword = txtconfirmPassword.text
            else {
                print("Form is not valid")
                return
        }
        
               FIRAuth.auth()?.createUser(withEmail : member, password:password , completion: {(user:FIRUser?,error) in
            if error != nil  {
                
                if let errCode = FIRAuthErrorCode(rawValue: error!._code){
                    switch errCode{
                    case.errorCodeInvalidEmail:
                        let alert = UIAlertController(title: "Message", message: "Invalid Email", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        print("Invalid Email")
                    case.errorCodeWeakPassword:
                        let alert = UIAlertController(title: "Message", message: "Weak Password!Password should be more than 6 characters", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        print("Weak Passwrod")
                    case.errorCodeEmailAlreadyInUse:
                        let alert = UIAlertController(title: "Message", message: "Email already in use! Press forgot button if you forget your Email/Password", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        print("in Use")
                    default:
                        print("Create User Error: \(error!)")
                    }
                    
                }
                
                
            }
                if password != confirmPassword {
                let alert = UIAlertController(title: "Message", message: "Miss Matching Password! Please Check them", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print("MissMatching Password")
                }
        })
            
        
        
            if ( self.txtpassword.text == self.txtconfirmPassword.text)
        {
           
            let ref = FIRDatabase.database().reference(fromURL: "https://crossword-c342a.firebaseio.com/")
            let values = ["Member":member,"Password":password]
            ref.child("Users").childByAutoId().setValue(values)

        }
        
        
        txtmember.text = ""
        txtconfirmPassword.text = ""
        txtpassword.text = ""
        
        
    }

    @IBAction func btnforgetPassword(_ sender: UIButton) {
        
        //Forget Butonuna Basıldıktan Sonra "Firebase"den mail gelmesi ve şifrenin güncellenmesi
        
        let alertController = UIAlertController(title: "Write Email", message: "Please enter your email adress", preferredStyle: UIAlertControllerStyle.alert)
        let findAction = UIAlertAction(title: "Send", style: UIAlertActionStyle.default){( action: UIAlertAction) in
            let emailTextField = alertController.textFields![0] as UITextField
            FIRAuth.auth()?.sendPasswordReset(withEmail: emailTextField.text!, completion: { (error) in
                
                var title = ""
                var message = ""
                
                if error != nil	 {
                    
                    title = "Opps"
                    message = (error?.localizedDescription)!
                }
                else
                {
                    title = "Success"
                    message = "Password reset email sent"
                }
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK!", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true , completion: nil)
            })
            
            
        }
      
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        alertController.addTextField { (textfield: UITextField) in
            textfield.placeholder = "email"
        }
        alertController.addAction(findAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated : true, completion: nil)
        
    }

}
