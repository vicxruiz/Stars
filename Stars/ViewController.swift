//
//  ViewController.swift
//  Stars
//
//  Created by Victor  on 4/30/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var starTextField: UITextField!
    
    @IBOutlet weak var distanceTextField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    let starController = StarController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        guard let name = starTextField.text, let distanceString = distanceTextField.text, let distance = Double(distanceString) else {return}
        starController.addStar(named: name, withDistance: distance)
    }
    
    //list all of the stars we're tracking
    
    
    
}

