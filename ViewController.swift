//
//  ViewController.swift
//  Lab1ProtectionInfo
//
//  Created by Игорь Козлов on 07.10.2020.
//  Copyright © 2020 Игорь Козлов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLable: UILabel!
    @IBOutlet weak var asymlable: UIButton!
    @IBOutlet weak var orLable: UILabel!
    @IBOutlet weak var symLable: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {

        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        orLable.layer.cornerRadius = orLable.frame.size.width / 4
        orLable.clipsToBounds = true
        
        asymlable.layer.cornerRadius = asymlable.frame.size.width / 8
        asymlable.clipsToBounds = true
        
        symLable.layer.cornerRadius = symLable.frame.size.width / 10
        symLable.clipsToBounds = true
        
        topLable.layer.cornerRadius = topLable.frame.size.width / 20
        topLable.clipsToBounds = true
        
        imageView.image = UIImage(named: "images.jpeg")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }

}

