//
//  ViewControllerB.swift
//  T_CoreData4
//
//  Created by Fausto Checa on 10/11/2018.
//  Copyright © 2018 ch2.fausto.com. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("------ 1. REQUEST an item (first) with Fetch ----->")
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let personFetchRequest: NSFetchRequest<Person> = Person.fetchRequest() // click fetchrequest for source
        
        personFetchRequest.fetchLimit = 1
        personFetchRequest.relationshipKeyPathsForPrefetching = ["cars"]
        
        do {
            let persons = try context.fetch(personFetchRequest)
            let person = persons.first!
            print(person.firstName!)  // OK ¡¡¡¡¡¡
            
            // GET cars for that person
            let cars = person.cars?.allObjects as! [Car]
            
            for car in cars {
                print(car.model!)
            }
            
            
        } catch {
            print(error)
        }
        
      print("------ 2. SEARCH a person in the DB with predicate-------")
        
         personFetchRequest.predicate = NSPredicate(format: "firstName == %@ && lastName == %@", argumentArray: ["Aurelia", "Valiño"])
        
        do {
            let persons = try context.fetch(personFetchRequest)
            let person = persons.first!
            print(person.firstName!)  // OK ¡¡¡¡¡¡
           
        } catch {
            print(error)
        }
        
        print("------ 2. SEARCH a person in the DB with a certain car-------")
        
        personFetchRequest.predicate = NSPredicate(format: "firstName LIKE[c] %@", argumentArray: ["F*"])
        
        do {
            let persons = try context.fetch(personFetchRequest)
            let person = persons.first!
            print(person.firstName!)  // OK ¡¡¡¡¡¡
            
        } catch {
            print(error)
        }
        
    }
}
