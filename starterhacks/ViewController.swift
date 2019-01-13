//
//  ViewController.swift
//  starterhacks
//
//  Created by Cumar Yusuf on 2019-01-12.
//  Copyright © 2019 Cumar Yusuf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var imgArr = [UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3"),
                  UIImage(named: "image4"), UIImage(named: "image5"), UIImage(named: "image6"),
                  UIImage(named: "image7"), UIImage(named: "image8"), UIImage(named: "image9")]
    var row = 0
    var status = ""
    var delegate: DrugDelegate?
    
    
    @IBAction func yes(_ sender: Any) {
        status = "yes"
        delegate?.change(row: row, status: status)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func no(_ sender: Any) {
        status = "no"
        delegate?.change(row: row, status: status)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "drug") {
            // initialize new view controller and cast it as your view controller
            let vc = segue.destination as! DrugTableViewController
            // your new view controller should have property that will store passed value
            vc.change(row: row, status: status)
        }
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DataCollectionViewCell
        cell?.img.image = imgArr[indexPath.row]
        return cell!
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
