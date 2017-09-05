//
//  ViewController.swift
//  JsonProject
//
//  Created by ukgroupe on 9/5/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var label: UILabel!
    @IBAction func button(_ sender: Any) {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + textfield.text!.replacingOccurrences(of: " ", with: "%20") + ",uk&appid=08e64df2d3f3bc0822de1f0fc22fcb2d")!
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                
                print("error")
            }else{
                
                if let jdata = data {
                    do{
                        
                        let jsondata =  try JSONSerialization.jsonObject(with: jdata, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        print(jsondata)
                        print(((jsondata["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String)
                    }catch{
                        
                        
                    }
                    
                }
                
            }
        }
        task.resume()
        

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

