//
//  ContainerViewController.swift
//  biv4
//
//  Created by Skylar Jones on 10/28/15.
//  Copyright (c) 2015 Skylar Jones. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
     var titleT: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.text = self.titleT
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
