//
//  ThridViewController.swift
//  Guesser
//
//  Created by student on 2/27/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ThridViewController: UIViewController {

    @IBOutlet weak var MinLBL: UILabel!
    @IBOutlet weak var MaxLBL: UILabel!
    @IBOutlet weak var MeanLBL: UILabel!
    @IBOutlet weak var StdLBL: UILabel!
    @IBAction func clearButton(_ sender: Any) {
        Guesser.shared.clearStatistics()
        MinLBL.text = "0"
        MaxLBL.text = "0"
        MeanLBL.text = "0"
        StdLBL.text = "0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statisticsvalues()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        statisticsvalues()
    }
    func statisticsvalues(){
        MinLBL.text = String(Guesser.shared.minimunAttempts())
        MaxLBL.text = String(Guesser.shared.maximumAttempts())
        MeanLBL.text = String(Guesser.shared.mean())
        StdLBL.text = String(Guesser.shared.dev())
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
