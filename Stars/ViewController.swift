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
        listStars()
        // Do any additional setup after loading the view.
    }
    
    private func clearTextFields() {
        starTextField.text = ""
        distanceTextField.text = ""
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        guard let name = starTextField.text, let distanceString = distanceTextField.text, let distance = Double(distanceString) else {return}
        starController.addStar(named: name, withDistance: distance)
        listStars()
        clearTextFields()
    }
    
    //list all of the stars we're tracking
    
    func listStars() {
        var output = ""
        
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away.\n"
        }
        
        textView.text = output
    }
    
}

