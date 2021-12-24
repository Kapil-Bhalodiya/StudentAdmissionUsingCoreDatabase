//
//  StudentView.swift
//  Student_Admission_CRUD
//
//  Created by DCS on 17/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudentView: UIViewController {
    
    private var notesArray = [NoticeDB]()
    
    private let tabbar:UITabBar = {
        let tool = UITabBar()
        let item1 = UITabBarItem(title: "info", image: #imageLiteral(resourceName: "info"), tag: 1)
        tool.tintColor = #colorLiteral(red: 0.01183097247, green: 0.4718669041, blue: 0, alpha: 1)
        tool.items = [item1]
        return tool
    }()
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Welcome ,"
        return label
    }()
    
    private let nameLabel:UILabel = {
        let label = UILabel()
        label.text = UserDefaults.standard.string(forKey: "uname") ?? ""
        label.textColor = #colorLiteral(red: 0.09485176601, green: 0.4562216645, blue: 0, alpha: 1)
        return label
    }()
    
    private let logoutbtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("LOGOUT", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.02956351541, green: 0.4719276231, blue: 0, alpha: 1)
        btn.addTarget(self, action: #selector(logoutclicked), for: .touchUpInside)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    private let mycollection : UICollectionView = {
        let cvl = UICollectionViewFlowLayout()
        cvl.sectionInset = UIEdgeInsets(top: 150, left: 20, bottom: 40, right: 20)
        cvl.itemSize = CGSize(width: 150, height: 75)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: cvl)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(mycollection)
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(logoutbtn)
        view.addSubview(tabbar)
        
        print(UserDefaults.standard.string(forKey: "div") ?? "")
        notesArray = CoreDataHandler.shared.fetchDiv(for: UserDefaults.standard.string(forKey: "div") ?? "")
        setData()
        mycollection.delegate = self
        tabbar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mycollection.frame = view.bounds
        titleLabel.frame = CGRect(x: 20, y: 50, width: 150, height: 30)
        nameLabel.frame = CGRect(x: 20, y: titleLabel.bottom + 10, width: 150, height: 30)
        logoutbtn.frame = CGRect(x: 250, y: 60, width: 150, height: 40)
        let tabbarheight:CGFloat=view.safeAreaInsets.bottom + 70.0
        tabbar.frame = CGRect(x : 0,y : view.height - tabbarheight,width : view.width ,height : tabbarheight )
    }
    
    @objc func logoutclicked(){
        UserDefaults.standard.setValue(nil, forKey: "uname")
        UserDefaults.standard.setValue(nil, forKey: "div")
        UserDefaults.standard.setValue(nil, forKey: "spid")
        let logout = LoginVC()
        navigationController?.pushViewController(logout, animated: true)
    }
}
extension StudentView: UICollectionViewDelegate,UICollectionViewDataSource {
    func setData(){
        mycollection.delegate = self
        mycollection.dataSource = self
        mycollection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Count : \(notesArray.count)")
        return notesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            cell.SetUpCell(with: notesArray[indexPath.row])
            cell.layer.borderWidth = 0.5
            cell.layer.shadowOpacity = 0.5
            cell.layer.shadowOffset = CGSize(width: 3, height: 3)
            cell.layer.shadowRadius = 4.0
            cell.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            cell.layer.cornerRadius = 30
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let seeNote = StudentNoticeView()
        seeNote.seenotice = notesArray[indexPath.row]
        navigationController?.pushViewController(seeNote, animated: true)
    }
}
extension StudentView : UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "info" {
            let ds = DetailView()
            navigationController?.pushViewController(ds, animated: true)
        }
    }
}
