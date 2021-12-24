//
//  DetailView.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
    
    private var DetailArray = [Student]()
    var Detail : Student?
    
    private let headlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Detail"
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        lbl.font = UIFont(name: "Arial", size: 30)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let spidheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "SPID"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let spidlbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    
    private let Userheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Username"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let Userlbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    private let Emailheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Email"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let Emaillbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    private let Passheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Password"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let Passlbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    private let changerPwdbtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Change Password", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1769022816, green: 0.5545053433, blue: 0.07903720916, alpha: 1)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(changePwdClick), for: .touchUpInside)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    private let Divheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Division"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let Divlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "dsd"
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    private let dateheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Date"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let datelbl:UILabel={
        let lbl = UILabel()
        lbl.text = "asd"
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(headlbl)
        view.addSubview(spidheadlbl)
        view.addSubview(spidlbl)
        view.addSubview(Userheadlbl)
        view.addSubview(Userlbl)
        view.addSubview(Passheadlbl)
        view.addSubview(Passlbl)
        view.addSubview(changerPwdbtn)
        view.addSubview(Divheadlbl)
        view.addSubview(Divlbl)
        view.addSubview(dateheadlbl)
        view.addSubview(datelbl)
        var id =  Int(UserDefaults.standard.string(forKey: "spid")!) ?? 0
        print("id is : \(id)")
        DetailArray = CoreDataHandler.shared.fetchDetali(for : id)
        spidlbl.text = String(DetailArray[0].spid)
        Userlbl.text = DetailArray[0].uname
        Passlbl.text = DetailArray[0].password
        Divlbl.text = DetailArray[0].div
        datelbl.text = DetailArray[0].div
    }
    
    @objc func changePwdClick(){
        let chgpwd = ChangePassword()
        navigationController?.pushViewController(chgpwd, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headlbl.frame = CGRect(x: 50, y: 60, width: view.width - 100, height: 50)
        spidheadlbl.frame = CGRect(x: 20, y: headlbl.bottom + 10, width: 150, height: 40)
        spidlbl.frame = CGRect(x: spidheadlbl.right + 30, y: spidheadlbl.top, width: view.width - 100, height: 40)
        Userheadlbl.frame = CGRect(x: 20, y: spidlbl.bottom + 20, width: 150, height: 40)
        Userlbl.frame = CGRect(x: Userheadlbl.right + 30, y: Userheadlbl.top, width: view.width - 100, height: 40)
        Passheadlbl.frame = CGRect(x: 20, y: Userlbl.bottom + 20, width: 150, height: 40)
        Passlbl.frame = CGRect(x: Passheadlbl.right + 30, y: Passheadlbl.top, width: view.width - 100, height: 40)
        Divheadlbl.frame = CGRect(x: 20, y: Passlbl.bottom + 20, width: 150, height: 40)
        Divlbl.frame = CGRect(x: Divheadlbl.right + 30, y: Divheadlbl.top, width: view.width - 100, height: 40)
        dateheadlbl.frame = CGRect(x: 20, y: Divlbl.bottom + 20, width: 150, height: 40)
        datelbl.frame = CGRect(x: dateheadlbl.right + 30, y: dateheadlbl.top, width: view.width - 100, height: 40)
        changerPwdbtn.frame = CGRect(x: 50, y: datelbl.bottom + 50, width: view.width-100, height: 40)
    }
}

