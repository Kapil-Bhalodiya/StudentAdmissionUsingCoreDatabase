//
//  StudentNoticeView.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 17/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudentNoticeView: UIViewController {
    
    var seenotice : NoticeDB?
    
    private let headlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Notice"
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 50)
        lbl.font = UIFont(name: "Arial", size: 40)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let titleheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Title"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let titlelbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    private let descheadlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Description"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 20)
        return lbl
    }()
    
    private let desclbl:UILabel={
        let lbl = UILabel()
        lbl.text = ""
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
        lbl.text = ""
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(headlbl)
        view.addSubview(titleheadlbl)
        view.addSubview(titlelbl)
        view.addSubview(descheadlbl)
        view.addSubview(desclbl)
        view.addSubview(dateheadlbl)
        view.addSubview(datelbl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let notes = seenotice {
            titlelbl.text = notes.title
            desclbl.text = notes.desc
            datelbl.text = notes.don
        }
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headlbl.frame = CGRect(x: 50, y: 60, width: view.width - 100, height: 50)
        titleheadlbl.frame = CGRect(x: 20, y: headlbl.bottom + 30, width: 150, height: 40)
        titlelbl.frame = CGRect(x: 20, y: titleheadlbl.bottom + 20, width: view.width - 100, height: 40)
        descheadlbl.frame = CGRect(x: 20, y: titlelbl.bottom + 30, width: 150, height: 40)
        desclbl.frame = CGRect(x: 20, y: descheadlbl.bottom + 20, width: view.width - 100, height: 40)
        dateheadlbl.frame = CGRect(x: 20, y: desclbl.bottom + 30, width: 150, height: 40)
        datelbl.frame = CGRect(x: 20, y: dateheadlbl.bottom + 20, width: view.width - 100, height: 40)
    }
}
