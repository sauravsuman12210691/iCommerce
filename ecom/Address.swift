//
//  Address.swift
//  ecom
//
//  Created by Student on 26/04/25.
//

import UIKit

class Address: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addAction(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Select Payment Method", message: nil, preferredStyle: .actionSheet)

        actionSheet.addAction(UIAlertAction(title: "Paytm", style: .default, handler: { _ in
            self.showOrderConfirmedPopup()
        }))
        actionSheet.addAction(UIAlertAction(title: "PhonePe", style: .default, handler: { _ in
            self.showOrderConfirmedPopup()
        }))
        actionSheet.addAction(UIAlertAction(title: "Google Pay", style: .default, handler: { _ in
            self.showOrderConfirmedPopup()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        if let popoverController = actionSheet.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.maxY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }

        present(actionSheet, animated: true, completion: nil)
    }

    func showOrderConfirmedPopup() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "OrderConfirmedVC") as? OrderConfirmedVC {
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true, completion: nil)
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
