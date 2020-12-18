//
//  ViewController.swift
//  tableViewSkeleton
//
//  Created by Hamza Mustafa on 17/12/2020.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {
    
    var data = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelay()
    }
    
    func setDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            for _ in 0...20 {
                self.data.append("Some text")
            }
            self.tableView.stopSkeletonAnimation()
            self.view.hideSkeleton()
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource , SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return skeletonCell.myID
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "skeletonCellid", for: indexPath) as? skeletonCell {
            if !data.isEmpty {
                cell.myLabel.text = data[indexPath.row]
                cell.myImage.image = UIImage(systemName: "star")
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
