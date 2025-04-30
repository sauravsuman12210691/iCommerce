import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var addtocart: UIButton!
    
    // Callback closure
    var addToCartAction: (() -> Void)?
    
    @IBAction func addToCartTapped(_ sender: Any) {
        addToCartAction?() // Triggers the callback when button is pressed
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Transparent cell background
        backgroundColor = .clear
        contentView.backgroundColor = UIColor(white: 1.0, alpha: 0.05)

        // Style image
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 8

        // Style button
        addtocart.backgroundColor = .systemBlue
        addtocart.setTitleColor(.white, for: .normal)
        addtocart.layer.cornerRadius = 6
        addtocart.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11)
    }


}
