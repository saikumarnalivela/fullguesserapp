//
//  FirstViewController.swift
//  Guesser
//
//  Created by student on 2/27/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var InputTF: UITextField!
    @IBOutlet weak var ResultsTF: UILabel!
    
    @IBAction func iamrightbutton(_ sender: Any) {
        let input = Int(InputTF.text!)
        if input == nil{
            displayerror()
        }
        else{
        ResultsTF.text = Guesser.shared.amIRight(guess: input!)
        if ResultsTF.text == "Correct"{
            displayMessage()
        }
        }
    }
    @IBAction func newproblem(_ sender: Any) {
        Guesser.shared.createNewProblem()
        InputTF.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func displayMessage(){
        let alert = UIAlertController(title: "Well done",
                                      message: "You got it in \(Guesser.shared.numAttempts) tries",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
        Guesser.shared.createNewProblem()
        InputTF.text = ""
    }
    
    func displayerror(){
        let alert = UIAlertController(title: "Error",
                                      message: "Please Enter the vaild Integer In the field",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
        Guesser.shared.createNewProblem()
        InputTF.text = ""
    }


}

