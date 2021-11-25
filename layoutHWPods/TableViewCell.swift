//
//  TableViewCell.swift
//  layoutHWPods
//
//  Created by Macbook on 25.11.21.
//

import UIKit
import Rswift
import SnapKit

class TableViewCell: UITableViewCell {
    
    static var identifier = "TableViewCell"
    @IBOutlet weak var contViewForImage: UIView!
    @IBOutlet weak var imageForContView: UIImageView!
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var bottomText: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configContViewForImage()
//        configImageView()
    }
    
    func configContViewForImage() {
        contViewForImage.layer.cornerRadius = 10
        contViewForImage.layer.borderColor = UIColor(red: 235/255, green: 235/255, blue: 236/255, alpha: 1).cgColor
        contViewForImage.layer.borderWidth = 2
    }
    
    func configImageView() {
        imageForContView.snp.makeConstraints {
            $0.top.equalTo(5)
            $0.left.equalTo(5)
            $0.right.equalTo(-5)
            $0.bottom.equalTo(-5)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
