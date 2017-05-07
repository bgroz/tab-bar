//
//  LoginViewController.swift
//  tab bar
//
//  Created by Bartuğ Maden on 03/05/2017.
//  Copyright © 2017 Buğra Öz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FBSDKLoginKit

class LoginViewController: UIViewController , FBSDKLoginButtonDelegate{
   

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupFacebookButton()
        // Do any additional setup after loading the view.

    }
  fileprivate func setupFacebookButton(){
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: 400, width: 343, height: 35)
    
        loginButton.delegate = self
        loginButton.readPermissions = ["email","public_profile"]
        
        
    }
    @IBAction func btnCreateUser(_ sender: UIButton) {
        
        
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out  of facebook")
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error)
            return
        }
        showEmailAdress()
            
    }
    func showEmailAdress(){
        
        
        let accessToken = FBSDKAccessToken.current()
        guard (accessToken?.tokenString) != nil else{return}
        let credentials  = FIRFacebookAuthProvider.credential(withAccessToken: (accessToken?.tokenString)!)
        FIRAuth.auth()?.signIn(with: credentials, completion: {(user,error) in
            if error != nil
            {
                print("Failed",error ?? "")
            }
            
            print ("Success")
        })
        
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields" : "id, name, email"]).start {(connection, result, err) in
            if err != nil{
                print("Failed",err ?? "")
                return
            }
            
            
        }
        
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
