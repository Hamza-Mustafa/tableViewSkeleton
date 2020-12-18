//
//  skeletonCell.swift
//  tableViewSkeleton
//
//  Created by Hamza Mustafa on 17/12/2020.
//

import UIKit
import SkeletonView

class skeletonCell: UITableViewCell {
    
    static let myID = "skeletonCellid"
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myLabel.linesCornerRadius = 20
        myImage.layer.cornerRadius = 20
    }
}
