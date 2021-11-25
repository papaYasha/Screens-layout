//
//  XibForUserInfo.swift
//  layoutHWPods
//
//  Created by Macbook on 23.11.21.
//

import UIKit

class XibForUserInfo: UIView {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var stick: UILabel!
    @IBOutlet weak var cross: UIButton!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var textField: UITextField!
    var onButtonTapped: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func actionCross(_ sender: Any) {
//        onButtonTapped?()
        textField.text = ""        
    }
    
}



