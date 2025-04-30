//
//  PracticeViewController.swift
//  ecom
//
//  Created by Student on 22/04/25.
//

import UIKit

class PracticeViewController:UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    let items = ["One", "Two", "Three", "Four", "Five"]
    // MARK: - UICollectionViewDataSource

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return items.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
            cell.backgroundColor = .systemBlue

            // Optional: add label programmatically
            for subview in cell.contentView.subviews {
                subview.removeFromSuperview() // clean up reusable cell
            }

            let label = UILabel(frame: cell.bounds)
            label.text = items[indexPath.row]
            label.textAlignment = .center
            label.textColor = .white
            cell.contentView.addSubview(label)

            return cell
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
