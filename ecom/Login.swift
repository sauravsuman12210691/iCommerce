//
//  Login.swift
//  ecom
//
//  Created by Student on 21/04/25.
//

import UIKit

class Login: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginbtn(_ sender: Any) {
        print(name.text)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = storyboard.instantiateViewController(withIdentifier: "Home") as? Home {
            // Pass the name
            homeVC.username = name.text ?? "Guest"
            // Navigate (push or present)
            navigationController?.pushViewController(homeVC, animated: true)
            
        }
    }
    
    
    
    
    
    
    
    
    /*
     
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
