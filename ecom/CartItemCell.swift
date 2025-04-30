import UIKit

class CartItemCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!

    func configure(with item: (name: String, price: String, image: UIImage?)) {
        productImageView.image = item.image ?? UIImage(systemName: "photo")
        titleLabel.text = item.name
        quantityLabel.text = "Qty: 1"
        priceLabel.text = item.price
        sizeLabel.text = "Size: M"
    }
}
