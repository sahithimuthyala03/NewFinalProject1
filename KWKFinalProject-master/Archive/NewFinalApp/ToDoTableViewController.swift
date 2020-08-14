//
//  ToDoTableViewController.swift
//  NewFinalApp
//
//  Created by Julie Ham on 8/13/20.
//  Copyright © 2020 Meghan Jachna. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var listOfToDo : [ToDoClass] = []

    func createToDo() -> [ToDoClass] {

         let swiftToDo = ToDoClass()
         swiftToDo.description = "Learn Swift"

         let dogToDo = ToDoClass()
         dogToDo.description = "Walk the Dog"

         return [swiftToDo, dogToDo]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        listOfToDo = createToDo()
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let eachToDo = listOfToDo[indexPath.row]
        cell.textLabel?.text = eachToDo.description

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as? AddToDoViewController {
        nextAddToDoVC.previousToDoTVC = self

        }

    }
}
