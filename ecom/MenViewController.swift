//
//  MenViewController.swift
//  ecom
//
//  Created by Student on 24/04/25.
//

import UIKit

class MenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let items = [
        ("Fastrack", "₹3349", UIImage(named: "bg1")),
        ("Sneakers", "₹2099", UIImage(named: "Sneakers")),
        ("Backpack", "₹3099", UIImage(named: "Bagpack")),
        ("Cap", "₹400", UIImage(named: "Cap")),
        ("Hoodie", "₹5099", UIImage(named: "Hoodie"))
    ]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgroundImageName") // <-- Replace with actual image name
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
       
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    // MARK: - Collection View Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ProductCell

        let item = items[indexPath.row]
        cell.lbl.text = item.0
        cell.price.text = item.1
        cell.img.image = item.2 ?? UIImage(systemName: "photo")
        cell.addtocart.setTitle("+", for: .normal)
        cell.addtocart.tag = indexPath.row
        cell.addtocart.addTarget(self, action: #selector(addToCart(_:)), for: .touchUpInside)

        // Card styling
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.systemGray5.cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.08
        cell.layer.masksToBounds = false

        return cell
    }

    // MARK: - Layout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 259, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    // MARK: - Add to Cart

    @objc func addToCart(_ sender: UIButton) {
        let index = sender.tag // Get the index of the selected item
        let item = items[index] // Get the item from the items array
        
        // Add item to CartManager
        CartManager.shared.addItemToCart(name: item.0, price: Double(item.1.dropFirst()) ?? 0.0, imageName: "Image", quantity: 1, size: "M")

        // Show success alert
        let alert = UIAlertController(title: "🛒 Added!", message: "✅ \(item.0) was successfully added to your cart!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }



}
