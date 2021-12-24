//
//  CoreDataHandler.swift
//  Student_Admission_CORE
//
//  Created by DCS on 22/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class CoreDataHandler {
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext : NSManagedObjectContext?
    
    private init(){
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save(){
        appDelegate.saveContext()
    }
    
   
    
    
    
    func Auth(spid:Int,password:String)-> [Student]{
        var getdata = [Student]()
        let fetchRequest:NSFetchRequest = Student.fetchRequest()
        let spidcpredict = NSPredicate(format: "spid contains \(spid) AND password contains \(password)")
        
        // let passcpredict = NSPredicate(format: "password contains %@", password)
        //let both = NSCompoundPredicate(andPredicateWithSubpredicates: [spidcpredict,passcpredict] )
        fetchRequest.predicate = spidcpredict
        
        do{
            getdata = try (managedObjectContext?.fetch(fetchRequest))!
            print(getdata.count)
            return getdata
        }catch{
            print("Error")
            return getdata
        }
    }
    
    func fetchDiv(for div: String) -> [NoticeDB] {
        var getNoteData = [NoticeDB]()
        let fr:NSFetchRequest = NoticeDB.fetchRequest()
        let predict  = NSPredicate(format: "div contains %@",div)
        fr.predicate = predict
        do{
            getNoteData = try (managedObjectContext?.fetch(fr))!
            return getNoteData
        }catch{
            return getNoteData
        }
    }
    
   
    func changePass(for pass:String,completion: @escaping((Bool) -> Void)){
        var fetchRequest:NSFetchRequest = Student.fetchRequest()
        let id = Student(context: managedObjectContext!)
        id.password = pass
        save()
        completion(true)
    }
    
    // Student
    
    
    func insert(spid:Int, gender: String, email:String, password:String, uname:String, div:String, dob:String,completion: @escaping((Bool) -> Void)){
        let stud = Student(context: managedObjectContext!)
        
        stud.uname = uname
        stud.spid = Int32(spid)
        stud.gender = gender
        stud.email = email
        stud.password = password
        stud.div = div
        stud.dob = dob
        
        save()
        completion(true)
    }
    
    func updateStud(stud:Student,spid:Int, gender: String, email:String, password:String, uname:String, div:String, dob:String){
        
        stud.uname = uname
        stud.spid = Int32(spid)
        stud.gender = gender
        stud.email = email
        stud.password = password
        stud.div = div
        stud.dob = dob
        
        save()
    }
    
    func delete(stud: Student, completion: @escaping () -> Void){
        managedObjectContext!.delete(stud)
        save()
        completion()
    }
    
    func fetchStud() -> [Student] {
        let fetchRequest:NSFetchRequest = Student.fetchRequest()
        do{
            let studArray = try managedObjectContext?.fetch(fetchRequest)
            print("Stud Count : \(studArray?.count)")
            return studArray!
        }catch{
            return [Student]()
        }
    }
    
    func fetchDetali(for id:Int) -> [Student] {
        let fetchRequest:NSFetchRequest = Student.fetchRequest()
        do{
            let data = try managedObjectContext?.fetch(fetchRequest)
            return data!
        }catch{
            return [Student]()
        }
    }
    
    //Notice
    
    func insertNote(title: String,desc:String,div:String,don:String){
        let insNote = NoticeDB(context: managedObjectContext!)
        insNote.title = title
        insNote.desc = desc
        insNote.div = div
        insNote.don = don
        
        save()
        print("Note Inserted..!")
    }
    
    func fetchNote() -> [NoticeDB] {
        let fetchRequest:NSFetchRequest = NoticeDB.fetchRequest()
        do{
            let noteArray = try managedObjectContext?.fetch(fetchRequest)
            return noteArray!
        }catch{
            return [NoticeDB]()
        }
    }
    
    
    func updateNote(note:NoticeDB,title: String,desc:String, div:String, don:String){
        
        note.title = title
        note.desc = desc
        note.div = div
        note.don = don
        save()
    }
    
    func deleteNote(note: NoticeDB, completion: @escaping () -> Void) {
        managedObjectContext!.delete(note)
        save()
    }
    
    
   
}
