//
//  ViewController.swift
//  Login_plist
//
//  Created by Owner on 2019-03-15.
//  Copyright © 2019 Owner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var user:String?
    var pass:String?
    @IBOutlet weak var txtpass: UITextField!
    @IBOutlet weak var txtuid: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnsignin(_ sender: UIButton) {
        readInformationPlist()
        
    }
    
    func readInformationPlist() {
        
       if let bundlePath = Bundle.main.path(forResource: "Login", ofType: "plist") {
            let dictionary = NSMutableDictionary(contentsOfFile: bundlePath)
        
             let employeeList = dictionary!["Employee"] as! NSArray
            for e in employeeList
            {
                let emp = e as! NSDictionary
                self.user=(emp["uid"]! as! String)
                self.pass=(emp["pass"]! as! String)
        
                if(user==txtuid.text && pass==txtpass.text)
                {
                    print("login sucess")
                    let ab = UIStoryboard(name: "Main", bundle: nil)
                    let VC1 = ab.instantiateViewController(withIdentifier: "home") as! HomeTableViewController
                    self.navigationController?.pushViewController(VC1, animated: true)
                }
                else
                {
                     
                    
                }
            }
            
            }
            
        }
    }


