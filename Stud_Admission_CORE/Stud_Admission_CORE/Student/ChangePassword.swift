//
//  LoginVC.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 13/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ChangePassword: UIViewController {
    
    private let txtOldPass:UITextField = {
        
        let email = UITextField()
        
        email.layer.cornerRadius = 10
        email.placeholder = "Old Password"
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: email.height))
        email.leftViewMode = .always
        email.layer.shadowOffset = CGSize(width: 3, height: 3)
        email.layer.shadowOpacity = 1.0
        email.layer.shadowRadius = 4.0
        email.layer.borderWidth = 0.5
        email.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        let img = UIImageView(frame: CGRect(x: 2, y: 2, width: 40, height: 20))
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "email-icon")
        email.rightView = img
        email.rightViewMode = .always
        return email
    }()
    
    private let txtNewPass:UITextField = {
        let password = UITextField()
        password.layer.cornerRadius = 10
        password.textColor = .black
        password.placeholder = "New Password"
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: password.height))
        password.leftViewMode = .always
        password.layer.shadowColor = UIColor.gray.cgColor
        password.layer.shadowOffset = CGSize(width: 3, height: 3)
        password.layer.shadowOpacity = 1.0
        password.layer.shadowRadius = 4.0
        password.layer.borderWidth = 0.5
        password.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        password.isSecureTextEntry = true
        let img = UIImageView(frame: CGRect(x: 2, y: 2, width: 40, height: 20))
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "password-icon")
        password.rightView = img
        password.rightViewMode = .always
        return password
    }()
    
    private let txtReNewPass:UITextField = {
        let password = UITextField()
        password.layer.cornerRadius = 10
        password.textColor = .black
        password.placeholder = "New Password"
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: password.height))
        password.leftViewMode = .always
        password.layer.shadowColor = UIColor.gray.cgColor
        password.layer.shadowOffset = CGSize(width: 3, height: 3)
        password.layer.shadowOpacity = 1.0
        password.layer.shadowRadius = 4.0
        password.layer.borderWidth = 0.5
        password.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        password.isSecureTextEntry = true
        let img = UIImageView(frame: CGRect(x: 2, y: 2, width: 40, height: 20))
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "password-icon")
        password.rightView = img
        password.rightViewMode = .always
        return password
    }()
    
    
    private let loginbtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1769022816, green: 0.5545053433, blue: 0.07903720916, alpha: 1)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    @objc func loginClick(){
        var alert = UIAlertController()
        if txtOldPass.text == UserDefaults.standard.string(forKey: "password")
        {
            let pass = txtNewPass.text!
            let repass = txtReNewPass.text!
            if pass == repass {
                CoreDataHandler.shared.changePass(for: pass){
                    success in
                    if success {
                        alert = UIAlertController(title: "Alert", message: "Password Changed Successfully..!", preferredStyle: UIAlertController.Style.alert)
                        let ls = LoginVC()
                        self.navigationController?.pushViewController(ls, animated: true)
                    }else{
                        alert = UIAlertController(title: "Alert", message: "Password not Changed..!", preferredStyle: UIAlertController.Style.alert)
                    }
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }else{
                alert = UIAlertController(title: "Alert", message: "Not matched..!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(txtOldPass)
        view.addSubview(txtNewPass)
        view.addSubview(txtReNewPass)
        view.addSubview(loginbtn)
        //SQLiteHandler.sahred.openDatabase()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        txtOldPass.frame = CGRect(x: 60, y: 350, width: view.width - 120, height: 40)
        txtNewPass.frame = CGRect(x: 60, y: txtOldPass.bottom + 10, width: view.width - 120, height: 40)
        txtReNewPass.frame = CGRect(x: 60, y: txtNewPass.bottom+10, width: view.width - 120, height: 40)
        loginbtn.frame = CGRect(x: 120, y: txtReNewPass.bottom + 50, width: view.width - 240, height: 40)
    }
}
