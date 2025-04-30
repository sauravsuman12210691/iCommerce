//
//  register.swift
//  ecom
//
//  Created by Student on 21/04/25.
//

import UIKit

class register: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Background image
        password.isSecureTextEntry = true
           cPassword.isSecureTextEntry = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgroundImageName") // <-- Replace with actual image name
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        // Validation Checks
        if name.text?.isEmpty == true || email.text?.isEmpty == true || password.text?.isEmpty == true || cPassword.text?.isEmpty == true {
            showAlert(title: "Error", message: "Please fill all fields.")
        } else if password.text != cPassword.text {
            showAlert(title: "Error", message: "Passwords do not match.")
        } else {
            showAlert(title: "Success", message: "Registration Successful!")
        }
    }

    // Helper function to show alerts
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var cPassword: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
