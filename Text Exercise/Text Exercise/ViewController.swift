//
//  ViewController.swift
//  Text Exercise
//
//  Created by Brian Redmond on 8/12/20.
//  Copyright © 2020 Brian Redmond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func writemytext(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do{
            try typetexthere.text.write(to:url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error writing file")
        }
    }
    
    
    @IBAction func readmytext(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do{
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displaytexthere.text = fileContent
        } catch{
            print("Error reading file")
        }
       }
    
   
    
    
    @IBOutlet weak var typetexthere: UITextView!
    
   
    
    
    @IBOutlet weak var displaytexthere: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        typetexthere.text = "Type your desired text here"
        displaytexthere.text = ""
    }


}

