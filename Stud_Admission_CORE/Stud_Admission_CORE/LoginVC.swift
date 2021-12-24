//
//  LoginVC.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 13/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    private let mylbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Login"
        lbl.textColor = #colorLiteral(red: 0.06836972239, green: 0.4769875324, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 80)
        lbl.font = UIFont(name: "Arial", size: 40)
        return lbl
    }()
    
    private let displaylbl:UILabel={
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Please Sign in to Continue...."
        lbl.font = lbl.font.withSize(10)
        return lbl
    }()
    
    private let txtEmail:UITextField = {
        let email = UITextField()
        email.layer.cornerRadius = 10
        email.placeholder = "Email ID"
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
    
    private let txtPass:UITextField = {
        let password = UITextField()
        password.layer.cornerRadius = 10
        password.textColor = .black
        password.placeholder = "Password"
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
        btn.setTitle("LOGIN", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1769022816, green: 0.5545053433, blue: 0.07903720916, alpha: 1)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    @objc func loginClick(){
        let spid = Int(txtEmail.text!)!
        let pass = txtPass.text ?? ""
        if spid == 1234 && pass == "123" {
            let admin = AdminView()
            navigationController?.pushViewController(admin, animated: true)
        }else{
            var alert = UIAlertController()
            var StudArray = [Student]()
            StudArray = CoreDataHandler.shared.Auth(spid: spid, password: pass)
            if StudArray.count > 0 {
                UserDefaults.standard.setValue(StudArray[0].uname, forKey: "uname")
                UserDefaults.standard.setValue(StudArray[0].spid, forKey: "spid")
                UserDefaults.standard.setValue(StudArray[0].div, forKey: "div")
                UserDefaults.standard.setValue(StudArray[0].password, forKey: "password")
                let Stud = StudentView()
                self.navigationController?.pushViewController(Stud,animated: true)
            }else{
                alert = UIAlertController(title: "Alert", message: "Not matched..!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mylbl)
        view.addSubview(displaylbl)
        view.addSubview(txtEmail)
        view.addSubview(txtPass)
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
        mylbl.frame = CGRect(x: 20, y: 90, width: view.width, height: 60)
        displaylbl.frame = CGRect(x: 20, y: mylbl.bottom + 10, width: view.width-150, height: 20)
        txtEmail.frame = CGRect(x: 60, y: 350, width: view.width - 120, height: 40)
        txtPass.frame = CGRect(x: 60, y: txtEmail.bottom + 20, width: view.width - 120, height: 40)
        loginbtn.frame = CGRect(x: 120, y: txtPass.bottom + 60, width: view.width - 240, height: 40)
    }
}
