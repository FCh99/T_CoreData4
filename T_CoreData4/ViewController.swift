//
//  ViewController.swift
//  T_CoreData4
//
//  Created by Fausto Checa on 10/11/2018.
//  Copyright © 2018 ch2.fausto.com. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myAppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = myAppDelegate.persistentContainer.viewContext
        
        // one person
        
        let person = Person(context: context)
        person.firstName = "Fausto"
        person.lastName = "Checa"
        
        
        // I need two cars to add this person:
        
        let car1 = Car(context: context)
        car1.maker = "VW"
        car1.model = "Sharan"
        car1.owner = person
        
        let car2 = Car(context: context)
        car2.maker = "VW"
        car2.model = "Tiguan"
        car2.owner = person
        
        person.cars?.addingObjects(from: [car1, car2])
        
        // ----------- another person
        
        let person2 = Person(context: context)
        person2.firstName = "Aurelia"
        person2.lastName = "Valiño"
        
        myAppDelegate.saveContext()
        
        
    }


}

