//
//  ShareViewController.swift
//  StrokeApp
//
//  Created by Chase Woodford on 1/22/16.
//  Copyright © 2016 Chase Woodford. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var ShareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShareButton.layer.cornerRadius = 5

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
