//
//  ViewController.swift
//  Web Services Example 2
//
//  Created by Louis Konig on 12/4/14.
//  Copyright (c) 2014 Louis Konig. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LTMorphingLabelDelegate {


    @IBOutlet weak var myNameLabel: LTMorphingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = AFHTTPRequestOperationManager()
        
        manager.GET( "http:/graph.facebook.com/nancynyc",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                println("JSON: " + responseObject.description)
            
                if let myName = responseObject.valueForKey("name") as? String {
                    
                    self.myNameLabel.text = myName
                    self.myNameLabel.morphingEffect = .Sparkle
                }
            
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    
        

    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

