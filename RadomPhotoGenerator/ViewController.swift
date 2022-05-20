//
//  ViewController.swift
//  RadomPhotoGenerator
//
//  Created by Juma on 5/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    let colors: [UIColor] = [
        .systemGreen,
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemOrange,
        .systemYellow,
        .systemGray
    ]
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let btn : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(imageView)
        imageView.frame = CGRect.init(x: 20, y: 20, width: 200, height: 200)
        imageView.center = view.center
        view.addSubview(btn)
        getRandomPhoto()
        btn.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        if let color = colors.randomElement(){
            view.backgroundColor = color
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btn.frame = CGRect.init(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }

    func getRandomPhoto() {
        guard let url = URL.init(string: Constants.urlAdress.rawValue) else {fatalError()}
        guard let data = try? Data(contentsOf: url) else {return}
        imageView.image = UIImage(data: data)
    }
    
}

enum Constants: String {
    case urlAdress = "https://random.imagecdn.app/500/150"
}

