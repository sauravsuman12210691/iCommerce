import UIKit

class CartViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {


   

    let items = [
        ("Fastrack", "₹3349", UIImage(named: "bg1")),
        ("Sneakers", "₹2999", UIImage(named: "Sneakers")),
        ("Backpack", "₹3099", UIImage(named: "Bagpack")),
        ("Cap", "₹4999", UIImage(named: "Cap")),
        ("Hoodie", "₹5999", UIImage(named: "Hoodie"))
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgroundImageName") // <-- Replace with actual image name
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        tableView.delegate = self
        tableView.dataSource = self
        
       
    }
    @IBOutlet weak var tableView: UITableView!

      
      

      // MARK: - TableView Methods

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return items.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else {
              return UITableViewCell()
          }

          let (name, price, image) = items[indexPath.row]
          cell.itemNameLabel.text = name
          cell.itemPriceLabel.text = price
          cell.itemImageView.image = image

          return cell
      }

      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          print("Selected Item: \(items[indexPath.row].0)")
      }
    // UITableViewDelegate Method
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 // Jo height chahiye wo de sakte ho
    }


    
}
