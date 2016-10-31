//
//  HistoryViewController.swift
//  simpleCalc2
//
//  Created by iGuest on 10/28/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var history = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(history)
        for element in history {
            let label = UILabel(frame: CGRect(x: 0, y: 75 + history.index(of: element)! * 30, width: 200, height: 21))
            label.textAlignment = .center
            label.text = element
            self.view.addSubview(label)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "CalcSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
