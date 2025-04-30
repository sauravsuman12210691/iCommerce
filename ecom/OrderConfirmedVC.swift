import UIKit

class OrderConfirmedVC: UIViewController {
    
    @IBOutlet weak var successImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "Order Confirmed! 🎉. Thanks for connecting."
        successImageView.image = UIImage(named: "success") // Apna success image yaha set karo
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateImage()
    }

    func animateImage() {
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut,
                       animations: {
            self.successImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.successImageView.transform = CGAffineTransform.identity
            }
        }
    }
}
