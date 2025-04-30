import UIKit

class Category: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var titile: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let images = ["Image 1", "Image 2", "Image 3", "Image 4"]
        var timer: Timer?
        var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        titile.textColor = UIColor.black
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgroundImageName") // <-- Replace with actual image name
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        collectionView.delegate = self
               collectionView.dataSource = self

               if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                   layout.scrollDirection = .horizontal
                   layout.minimumLineSpacing = 0
               }

               collectionView.isPagingEnabled = true

            startAutoScroll()//scrolling function call,

        // Enable tap gesture on the New Arrivals image
        newArrivalsImg.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        newArrivalsImg.addGestureRecognizer(tapGesture)
    }
    // MARK: - Auto Scroll Timer
        func startAutoScroll() {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(moveToNextImage), userInfo: nil, repeats: true)
        }

        @objc func moveToNextImage() {
            if currentIndex < images.count - 1 {
                currentIndex += 1
            } else {
                currentIndex = 0
            }

            let indexPath = IndexPath(item: currentIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }

        // Stop timer when view disappears (optional good practice)
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            timer?.invalidate()
        }

        // UICollectionView Methods
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return images.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSliderCell", for: indexPath) as! ImageSliderCell
            cell.imageView.image = UIImage(named: images[indexPath.item])
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return collectionView.frame.size
        }
    @IBAction func SegmentAction(_ sender: Any) {
        // Change content based on the selected segment
        switch SegmentOutlet.selectedSegmentIndex {
        case 0:
            // Men
            NewArrivals.text = "New Arrivals for Men"
            newArrivalsImg.image = UIImage(named: "Image 11")
            ShoesForCategorylbl.text = "Men's Shoes"
            img2ForCategory.image = UIImage(named: "menShoes")
            accesoriesLblforCategory.text = "Men's Accessories"
            img3Categroy.image = UIImage(named: "watch")

        case 1:
            // Women
            NewArrivals.text = "New Arrivals for Women"
            newArrivalsImg.image = UIImage(named: "Image 10")
            ShoesForCategorylbl.text = "Women's Shoes"
            img2ForCategory.image = UIImage(named: "Sneakers")
            accesoriesLblforCategory.text = "Women's Accessories"
            img3Categroy.image = UIImage(named: "watch")

        case 2:
            // Children
            NewArrivals.text = "New Arrivals for Children"
            newArrivalsImg.image = UIImage(named: "Image 9")
            ShoesForCategorylbl.text = "Kids' Shoes"
            img2ForCategory.image = UIImage(named: "childshoes")
            accesoriesLblforCategory.text = "Kids' Accessories"
            img3Categroy.image = UIImage(named: "childwatch")

        default:
            break
        }
    }

    @objc func imageTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Push the appropriate view controller based on the selected segment
        switch SegmentOutlet.selectedSegmentIndex {
        case 0:
            if let menVC = storyboard.instantiateViewController(withIdentifier: "MenViewController") as? MenViewController {
                self.navigationController?.pushViewController(menVC, animated: true)
            }
            
        case 1:
            if let womenVC = storyboard.instantiateViewController(withIdentifier: "WomenViewController") as? WomenViewController {
                self.navigationController?.pushViewController(womenVC, animated: true)
            }
            
        case 2:
            if let childVC = storyboard.instantiateViewController(withIdentifier: "ChildrenViewController") as? ChildrenViewController {
                self.navigationController?.pushViewController(childVC, animated: true)
            }
            
        default:
            break
        }
    }

    @IBOutlet weak var SegmentOutlet: UISegmentedControl!
    @IBOutlet weak var NewArrivals: UILabel!
    @IBOutlet weak var newArrivalsImg: UIImageView!
    @IBOutlet weak var ShoesForCategorylbl: UILabel!
    @IBOutlet weak var img2ForCategory: UIImageView!
    @IBOutlet weak var accesoriesLblforCategory: UILabel!
    @IBOutlet weak var img3Categroy: UIImageView!
}
