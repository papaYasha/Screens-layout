//
//  ViewController.swift
//  layoutHWPods
//
//  Created by Macbook on 23.11.21.
//

import UIKit
import SnapKit
import SwiftUI
import Rswift

class ViewController: UIViewController {
    
    @IBOutlet weak var loginUpToDate: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var login: UIView!
    @IBOutlet weak var faceID: UIView!
    @IBOutlet weak var contView1: UIView!
    @IBOutlet weak var contView2: UIView!
    @IBOutlet weak var contView3: UIView!
    @IBOutlet weak var secondScreenTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondScreen: UIView!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var blackView: UIView!
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBOutlet weak var back: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var superViewForLogOut: UIView!
    @IBOutlet weak var borderViewForLogOut: UIView!
    
    let icons = ["user", "headphones", "document", "pngegg"]
    let topTextArray = ["Login details", "Help", "Legal information", "Face ID verification"]
    let bottomTextArray = ["User name, Password", "FAQ's, Helpdesk", "Terms & Conditions", "Enabled"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        configBackButton()
        configSecondScreen()
        configSuperViewForLogOut()
        configBorderView()
        configTableView()
        addCustomView()
        configLoginLabel()
        configBlackViewAndPlus()
    }
    
    func configBackButton() {
        back.layer.shadowColor = UIColor.black.cgColor
        back.layer.shadowOpacity = 0.2
        back.layer.shadowOffset = .zero
        back.layer.shadowRadius = 10
        back.layer.shouldRasterize = true
        imageView.layer.cornerRadius = 20
        faceID.layer.borderWidth = 1
        faceID.layer.borderColor = UIColor.black.cgColor
    }
    
    func configSecondScreen() {
        secondScreen.layer.cornerRadius = 50
        secondScreen.layer.shadowColor = UIColor.gray.cgColor
        secondScreen.layer.shadowOpacity = 0.2
        secondScreen.layer.shadowOffset = .zero
        secondScreen.layer.shadowRadius = 10
        secondScreen.layer.shouldRasterize = true
    }
    
    func configSuperViewForLogOut() {
        superViewForLogOut.layer.shadowColor = UIColor.lightGray.cgColor
        superViewForLogOut.layer.shadowOpacity = 0.25
        superViewForLogOut.layer.shadowOffset = .zero
        superViewForLogOut.layer.shadowRadius = 5
        superViewForLogOut.layer.shouldRasterize = true
        superViewForLogOut.layer.borderWidth = 1
        superViewForLogOut.layer.borderColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1).cgColor
    }
    
    func configBorderView() {
        borderViewForLogOut.layer.borderWidth = 1
        borderViewForLogOut.layer.borderColor = UIColor.black.cgColor
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.layer.cornerRadius = 20
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1).cgColor
    }
    
    func addCustomView() {
        configCustomView()
        configCustomView2()
        configCustomView3()
    }
    
    func configCustomView() {
        let customView = Bundle.loadView(fromNib: "xibForUserInfo", withType: XibForUserInfo.self)
        customView.layer.cornerRadius = 20
        customView.textField.delegate = self
        contView1.addSubview(customView)
    }
    
    func configCustomView2() {
        let customView2 = Bundle.loadView(fromNib: "xibForUserInfo", withType: XibForUserInfo.self)
        customView2.layer.cornerRadius = 20
        customView2.cross.isHidden = true
        customView2.stick.isHidden = true
        customView2.userName.text = "Organization"
        customView2.textField.font = UIFont(name: "System-Regular", size: 17)
        customView2.textField.delegate = self
        contView2.addSubview(customView2)
    }
    
    func configCustomView3() {
        let customView3 = Bundle.loadView(fromNib: "xibForUserInfo", withType: XibForUserInfo.self)
        customView3.layer.cornerRadius = 20
        customView3.cross.setImage(UIImage(named: "eye"), for: .normal)
        customView3.userName.text = "Password"
        customView3.textField.isSecureTextEntry = true
        contView3.addSubview(customView3)
        customView3.textField.delegate = self
        //        customView3.actionCross(UIButton())
    }
    
    func configLoginLabel() {
        let text = "Login to beUpToDate"
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.foregroundColor, value: UIColor(red: 7/255, green: 66/255, blue: 250/255, alpha: 1), range: NSRange(location: 9, length: 10))
        loginUpToDate.attributedText = attributedText
    }
    
    func configBlackViewAndPlus() {
        plus.snp.makeConstraints {
            $0.top.equalTo(7)
            $0.left.equalTo(6)
            $0.right.equalTo(-6)
            $0.bottom.equalTo(-7)
        }
        plus.contentHorizontalAlignment = .fill
        plus.contentVerticalAlignment = .fill
        plus.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        secondScreenTrailingConstraint.constant = (view.frame.width + secondScreen.frame.width) / 2
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func actionBackButton(_ sender: Any) {
        secondScreenTrailingConstraint.constant = 0
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
}

extension Bundle {
    
    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        fatalError("Could not load view with type " + String(describing: type))
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Circle()
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.topText.text = topTextArray[indexPath.row]
        cell.bottomText.text = bottomTextArray[indexPath.row]
        cell.imageForContView.image = UIImage(named: icons[indexPath.row])
        return cell
    }
}



