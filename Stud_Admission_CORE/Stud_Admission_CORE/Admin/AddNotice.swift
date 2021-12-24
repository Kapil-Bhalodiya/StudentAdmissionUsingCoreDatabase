//
//  AddNotice.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 16/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AddNotice: UIViewController {
    
    var notice : NoticeDB?
    
    private let headlbl:UILabel={
        
        let lbl = UILabel()
        lbl.text = "Add Notice"
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 50)
        lbl.font = UIFont(name: "Arial", size: 40)
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    private let titleText:UITextField = {
        let user = UITextField()
        user.layer.cornerRadius = 10
        user.placeholder = "Title"
        user.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: user.height))
        user.leftViewMode = .always
        user.layer.shadowColor = #colorLiteral(red: 0.2680937266, green: 0.5423540228, blue: 0.1122479198, alpha: 1)
        user.layer.shadowOpacity = 0.7
        user.layer.shadowRadius = 2.0
        user.layer.borderWidth = 1.0
        return user
    }()
    
    
    private let contentText:UITextField = {
        let email = UITextField()
        email.layer.cornerRadius = 10
        email.placeholder = "Desciption"
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: email.height))
        email.leftViewMode = .always
        email.layer.shadowColor = #colorLiteral(red: 0.2680937266, green: 0.5423540228, blue: 0.1122479198, alpha: 1)
        email.layer.shadowOpacity = 0.7
        email.layer.shadowRadius = 2.0
        email.layer.borderWidth = 1.0
        return email
    }()
    
    private let division : UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "A", at: 0, animated: true)
        sc.insertSegment(withTitle: "B", at: 1, animated: true)
        sc.insertSegment(withTitle: "C", at: 2, animated: true)
        sc.insertSegment(withTitle: "ALL", at: 3, animated: true)
        sc.selectedSegmentIndex = 3
        sc.backgroundColor = #colorLiteral(red: 0.2721412224, green: 0.4613018135, blue: 0.1388179484, alpha: 1)
        sc.tintColor = .white
        sc.layer.cornerRadius = 10
        return sc
    }()
    
    private let DatePicker : UIDatePicker = {
        let dp = UIDatePicker()
        dp.timeZone = NSTimeZone.local
        dp.datePickerMode = UIDatePicker.Mode.date
        return dp
    }()
    
    private let registerbtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("ADD", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1769022816, green: 0.5545053433, blue: 0.07903720916, alpha: 1)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(registerClick), for: .touchUpInside)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    @objc func registerClick(){
        
        let title = titleText.text!
        let desc = contentText.text!
        let div = division.titleForSegment(at: division.selectedSegmentIndex)!
        let cal = Calendar.current
        let components = cal.dateComponents([.day,.month,.year], from: DatePicker.date)
        let don = "\(components.day!)-\(components.month!)-\(components.year!)"
        print(don)
        var alert = UIAlertController()
        if let note = notice {
            CoreDataHandler.shared.updateNote(note: notice!, title: title, desc: desc, div: div, don: don)
            alert = UIAlertController(title: "Alert", message: "Notice Updated..!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            CoreDataHandler.shared.insertNote(title: title, desc: desc, div: div, don: don)
            alert = UIAlertController(title: "Alert", message: "Notice Added..!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(headlbl)
        view.addSubview(titleText)
        view.addSubview(contentText)
        view.addSubview(division)
        view.addSubview(DatePicker)
        view.addSubview(registerbtn)
        
        if let note = notice {
            registerbtn.setTitle("UPDATE", for: .normal)
            titleText.text = note.title
            contentText.text = note.desc
            division.setTitle(note.div, forSegmentAt: division.selectedSegmentIndex)
            //        let notedate = note.don
            //        DatePicker.date = note.don)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headlbl.frame = CGRect(x: 50, y: 60, width: view.width - 100, height: 50)
        titleText.frame = CGRect(x: 50, y: headlbl.bottom + 30, width: view.width - 100, height: 50)
        contentText.frame = CGRect(x: 50, y: titleText.bottom + 20, width: view.width - 100, height: 150)
        division.frame = CGRect(x: 60, y: contentText.bottom + 20, width: view.width - 120, height: 40)
        DatePicker.frame = CGRect(x: 60, y: division.bottom + 20, width: view.width - 120, height: 40)
        registerbtn.frame = CGRect(x: 60, y: DatePicker.bottom + 50, width: view.width - 120, height: 40)
        
    }
}
