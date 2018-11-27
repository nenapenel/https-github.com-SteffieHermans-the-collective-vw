//
//  ViewController.swift
//  testingFirebase
//
//  Created by Nena Penel on 26/11/2018.
//  Copyright © 2018 Nena Penel. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var refNames: DatabaseReference!

    //dit is een test voor de commit.
    @IBOutlet weak var voorNaam: UITextField!
    @IBOutlet weak var achterNaam: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBAction func voegToe(_ sender: UIButton) {
        addNames()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refNames = Database.database().reference().child("names");
    }
    
    func addNames(){
        let key = refNames.childByAutoId().key
        let name = ["id": key,
                     "voorNaam": voorNaam.text! as String,
                     "achternaam": achterNaam.text! as String
                    ]
        refNames.child(key).setValue(name)
        labelMessage.text = "Je bent toegevoegd aan de lijst"
    }


}

