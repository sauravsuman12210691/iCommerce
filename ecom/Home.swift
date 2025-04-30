import UIKit

class Home: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Array to store cart items
    

    let items = [
        ("Fastrack", "₹3340", UIImage(named: "bg1")),
        ("Sneakers", "₹2000", UIImage(named: "Sneakers")),
        ("Backpack", "$3000", UIImage(named: "Bagpack")),
        ("Cap", "₹4000", UIImage(named: "Cap")),
        ("Hoodie", "₹5500", UIImage(named: "Hoodie"))
    ]
   
    
    let items2 = [
        ("Watch", "₹1999", UIImage(named: "watch")),
        ("Glasses", "₹2999", UIImage(named: "Image")),
        ("Wallet", "₹350", UIImage(named: "Wallet")),
        ("Shoes", "₹4999", UIImage(named: "Shoes")),
        ("Bag", "₹5599", UIImage(named: "Bag"))
    ]
    
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var userName: UILabel!

    var username: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgroundImageName") // <-- Replace with actual image name
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        // Username
        userName.text = "Welcome, \(username ?? "Guest")"
        userName.textColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView2.dataSource = self
        collectionView2.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        if let tabBarController = self.tabBarController,
//           let viewControllers = tabBarController.viewControllers,
//           let cartVC = viewControllers[1] as? CartViewController {
//            cartVC.cartItems = self.cartItems
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return items.count
        } else {
            return items2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ProductCell
        
        let item = collectionView == self.collectionView ? items[indexPath.row] : items2[indexPath.row]
        cell.lbl.text = item.0
        cell.price.text = item.1
        cell.img.image = item.2 ?? UIImage(systemName: "photo")
        cell.addtocart.setTitle("+", for: .normal)
        
        // Text Colors
        cell.lbl.textColor = .white
        cell.price.textColor = .lightGray
        
        // Button Style
        cell.addtocart.setTitleColor(.white, for: .normal)
        cell.addtocart.backgroundColor = UIColor.systemBlue
        cell.addtocart.layer.cornerRadius = 8
        
        // Set tag and identifier
        cell.addtocart.tag = indexPath.row
        cell.addtocart.accessibilityIdentifier = collectionView == self.collectionView ? "collection1" : "collection2"
        cell.addtocart.addTarget(self, action: #selector(addToCart(_:)), for: .touchUpInside)
        
        // Card Style
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor(white: 1.0, alpha: 0.1).cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    @objc func addToCart(_ sender: UIButton) {
        let index = sender.tag
        let source = sender.accessibilityIdentifier
        
        let item: (String, String, UIImage?)
        if source == "collection1" {
            item = items[index]
        } else {
            item = items2[index]
        }
        
//        cartItems.append((name: item.0, price: item.1, image: item.2))
        
//        for item in cartItems {
//            print("Item: \(item.name), Price: \(item.price)")
//        }
        
        let alert = UIAlertController(
            title: "🛒 Added!",
            message: "✅ \(item.0) was successfully added to your cart!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
