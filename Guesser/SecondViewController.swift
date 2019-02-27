//
//  SecondViewController.swift
//  Guesser
//
//  Created by student on 2/27/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Guesser.shared.numGuesses()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celltype")
        cell?.textLabel?.text = "Correct Answer: " + String(Guesser.shared[indexPath.row].correctAnswer)
        cell?.detailTextLabel?.text = "#Attempts: " + String(Guesser.shared[indexPath.row].numAttempts)
        return cell!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    @IBOutlet weak var HistoryView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        HistoryView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        HistoryView.dataSource = self
        HistoryView.delegate = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    


}

