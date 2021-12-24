import UIKit

class AddStudent: UIViewController {
    
    var student : Student?
    
    private let headlbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Add Student"
        lbl.textColor = #colorLiteral(red: 0.2680174036, green: 0.4543116004, blue: 0.136714408, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 50)
        lbl.font = UIFont(name: "Arial", size: 40)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let spidtxt:UITextField = {
        let user = UITextField()
        user.layer.cornerRadius = 10
        user.placeholder = "SPID"
        user.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: user.height))
        user.leftViewMode = .always
        user.layer.shadowColor = #colorLiteral(red: 0.2680937266, green: 0.5423540228, blue: 0.1122479198, alpha: 1)
        user.layer.shadowOpacity = 0.7
        user.layer.shadowRadius = 2.0
        user.layer.borderWidth = 1.0
        return user
    }()
    
    
    private let reguser:UITextField = {
        let user = UITextField()
        user.layer.cornerRadius = 10
        user.placeholder = "User Name"
        user.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: user.height))
        user.leftViewMode = .always
        user.layer.shadowColor = #colorLiteral(red: 0.2680937266, green: 0.5423540228, blue: 0.1122479198, alpha: 1)
        user.layer.shadowOpacity = 0.7
        user.layer.shadowRadius = 2.0
        user.layer.borderWidth = 1.0
        return user
    }()
    
    private let gender : UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "Male", at: 0, animated: true)
        sc.insertSegment(withTitle: "Female", at: 1, animated: true)
        sc.insertSegment(withTitle: "Transgender", at: 2, animated: true)
        sc.selectedSegmentIndex = 1
        sc.backgroundColor = #colorLiteral(red: 0.2721412224, green: 0.4613018135, blue: 0.1388179484, alpha: 1)
        sc.tintColor = .white
        sc.layer.cornerRadius = 10
        return sc
    }()
    
    private let regEmail:UITextField = {
        let email = UITextField()
        email.layer.cornerRadius = 10
        email.placeholder = "Email ID"
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: email.height))
        email.leftViewMode = .always
        email.layer.shadowColor = #colorLiteral(red: 0.2680937266, green: 0.5423540228, blue: 0.1122479198, alpha: 1)
        email.layer.shadowOpacity = 0.7
        email.layer.shadowRadius = 2.0
        email.layer.borderWidth = 1.0
        return email
    }()
    
    private let regPass:UITextField = {
        let password = UITextField()
        password.layer.cornerRadius = 10
        password.placeholder = "Password"
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: password.height))
        password.leftViewMode = .always
        password.layer.shadowColor = #colorLiteral(red: 0.3197782056, green: 0.5420504282, blue: 0.1631173479, alpha: 1)
        password.layer.shadowOpacity = 0.7
        password.layer.shadowRadius = 2.0
        password.layer.borderWidth = 1.0
        return password
    }()
    
    private let division : UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "A", at: 0, animated: true)
        sc.insertSegment(withTitle: "B", at: 1, animated: true)
        sc.insertSegment(withTitle: "C", at: 2, animated: true)
        sc.selectedSegmentIndex = 0
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
        
        let spid = Int(spidtxt.text!)!
        let uname = reguser.text!
        let gen = gender.titleForSegment(at: gender.selectedSegmentIndex)!
        let email = regEmail.text!
        let password = regPass.text!
        let div = division.titleForSegment(at: division.selectedSegmentIndex)!
        var Dob = ""
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day,.month,.year], from: self.DatePicker.date)
        if let day = components.day, let month = components.month, let year = components.year {
            Dob = "\(day)/\(month)/\(year)"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd'/'MM'/'yyyy'"
        let date = dateFormatter.date(from: Dob)
        var alert = UIAlertController()
        if let stud = student {
            CoreDataHandler.shared.updateStud(stud: student!,spid: spid, gender: gen, email: email, password: password, uname: uname, div: div, dob: Dob)
            alert = UIAlertController(title: "Alert", message: "Updated..!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            
            CoreDataHandler.shared.insert(spid: spid, gender: gen, email: email, password: password, uname:uname, div: div, dob: Dob){
                success in
                if(success){
                    alert = UIAlertController(title: "Alert", message: "Insert Succesfully..!", preferredStyle: UIAlertController.Style.alert)
                  
                }else{
                    alert = UIAlertController(title: "Alert", message: "Not Inserted..!", preferredStyle: UIAlertController.Style.alert)
                }
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(headlbl)
        view.addSubview(spidtxt)
        view.addSubview(reguser)
        view.addSubview(gender)
        view.addSubview(regEmail)
        view.addSubview(regPass)
        view.addSubview(division)
        view.addSubview(DatePicker)
        view.addSubview(registerbtn)
        
        if let stud = student {
            registerbtn.setTitle("UPDATE", for: .normal)
            spidtxt.text = String(stud.spid)
            spidtxt.isEnabled = false
            spidtxt.text = String(stud.spid)
            reguser.text = stud.uname
            regEmail.text = stud.email
            regPass.text = stud.password
            //division.setTitle(stud.div, forSegmentAt: division.selectedSegmentIndex)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headlbl.frame = CGRect(x: 50, y: 60, width: view.width - 100, height: 50)
        spidtxt.frame = CGRect(x: 60, y: headlbl.bottom + 30, width: view.width-120, height: 40)
        reguser.frame = CGRect(x: 60, y: spidtxt.bottom + 20, width: view.width - 120, height: 40)
        gender.frame = CGRect(x: 60, y: reguser.bottom + 20, width: view.width - 120, height: 40)
        regEmail.frame = CGRect(x: 60, y: gender.bottom + 20, width: view.width - 120, height: 40)
        regPass.frame = CGRect(x: 60, y: regEmail.bottom + 20, width: view.width - 120, height: 40)
        division.frame = CGRect(x: 60, y: regPass.bottom + 20, width: view.width - 120, height: 40)
        DatePicker.frame = CGRect(x: 60, y: division.bottom + 20, width: view.width - 120, height: 40)
        registerbtn.frame = CGRect(x: 60, y: DatePicker.bottom + 50, width: view.width - 120, height: 40)
        
    }
    
}
